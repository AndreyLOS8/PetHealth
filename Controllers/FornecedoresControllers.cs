using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Contexts;
using Models;
using Models.HttpRequests;
using Models.HttpResponse;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FornecedoresController : ControllerBase
    {
        private readonly PetHealthDbContext _contexto;

        public FornecedoresController(PetHealthDbContext contexto)
        {
            _contexto = contexto;
        }

        // POST: api/fornecedores/cadastrar
        [HttpPost("cadastrar")]
        public ActionResult Cadastrar([FromBody] FornecedorRequest cadastro)
        {
             using (var transacaoDeCadastro = _contexto.Database.BeginTransaction())
        {
            try
            {
                var fornecedor = new Fornecedor
                {
                    RazaoSocial = cadastro.RazaoSocial,
                    Cnpj = cadastro.Cnpj,
                    Telefone = cadastro.Telefone,
                    Email = cadastro.Email
                };
                _contexto.Fornecedores.Add(fornecedor);
                _contexto.SaveChanges();

                transacaoDeCadastro.Commit();

                return StatusCode(201, new { idFornecedor = fornecedor.Id });
            }
            catch (DbUpdateException dbEx)
            {               
                var innerException = dbEx.InnerException?.Message ?? dbEx.Message;
                return StatusCode(500, new { mensagem = "Erro ao atualizar o banco de dados.", detalhes = innerException });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { mensagem = "Erro interno no servidor.", detalhes = ex.Message });
            }
        }
    }
        // GET: api/fornecedores/{idFornecedor}
        [HttpGet("{idFornecedor}")]
        public ActionResult<FornecedorResponse> ObterPelaId(long idFornecedor)
        {
            try
            {
                var fornecedor = _contexto.Fornecedores
                    .Where(f => f.Id == idFornecedor)
                    .Select(f => new FornecedorResponse
                    {
                        Id = f.Id,
                        RazaoSocial = f.RazaoSocial,  // Atualizado para corresponder ao nome da propriedade em FornecedorResponse
                        Cnpj = f.Cnpj,
                        Telefone = f.Telefone,
                        Email = f.Email
                    })
                    .FirstOrDefault();

                if (fornecedor == null)
                {
                    return NotFound(new { mensagem = "Fornecedor não encontrado." });
                }

                return Ok(fornecedor);
            }
            catch (DbUpdateException dbEx)
            {               
                var innerException = dbEx.InnerException?.Message ?? dbEx.Message;
                return StatusCode(500, new { mensagem = "Erro ao atualizar o banco de dados.", detalhes = innerException });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { mensagem = "Erro interno no servidor.", detalhes = ex.Message });
            }
        }
    }
}
