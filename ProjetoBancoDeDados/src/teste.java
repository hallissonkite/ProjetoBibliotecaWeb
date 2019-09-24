
import DaoImagem.DaoImagem;
import DaoReserva.factoryReservaDao;
import DaoReserva.JDBCreservaDao;
import DaoReserva.reservaDaos;
import DaoReserva.reservaDao;
import DaoUsuario.DaoUsuario;
import DaoUsuario.JDBCDaoUsuario;
import DaoUsuario.FactoryDao;
import model.Livro;
import model.principal;
import Servlet.cancelarReservaServlet;
import Servlet.capturarExcesao;
import Servlet.descricoesServlet;
import Servlet.LoginServlet;
import Servlet.reservaServlet;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author hallisson
 */
public class teste {

    private Veri v;

    public testeUnidade() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        v = new Veri();
    }

    @After
    public void tearDown() {
    }
    
    @Test

    public void testValidarLogin() {

        assertEquals(true, v.validarLogin("Hallissonkite","hallisson123"));

    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
