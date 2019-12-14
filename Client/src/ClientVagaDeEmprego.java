
import utils.Requests;

import java.rmi.*;
import java.util.Scanner;

public class ClientVagaDeEmprego {
    public static void main(String[] args) {
        Scanner options = new Scanner(System.in);  // Create a Scanner object
        String option = "0";
        //Loopim do menu
        while (!option.equals("4")) {
            System.out.println("Digite 1 para CADASTRAR uma vaga de Emprego");
            System.out.println("Digite 2 para ALTERAR vaga de emprego cadastrada");
            System.out.println("Digite 3 para CONSULTAR os curriculos dos candidatos");
            System.out.println("Digite 4 para sair");

            option = options.nextLine();
            Scanner myObj = new Scanner(System.in);  // Create a Scanner object
            try {
                if ((option.equals("1"))){
                    //Conecta no servidor de vagas de emprego
                    System.out.println("Conectado ao servidor de vagas de emprego");
                    System.out.println("CNPJ: ");
                    String cnpj = myObj.nextLine();  // Read user input
                    System.out.println("Nome da Empresa: ");
                    String nome_empresa = myObj.nextLine();  // Read user input
                    System.out.println("Area da vaga: ");
                    String area_da_vaga = myObj.nextLine();  // Read user input
                    System.out.println("Salario Pago: ");
                    String salario_pago = myObj.nextLine();  // Read user input
                    System.out.println("Carga horaria: ");
                    String carga_horaria = myObj.nextLine();  // Read user input
                    System.out.println("Contato Empresa: ");
                    String contato_empresa = myObj.nextLine();  // Read user input
                    //Inicializa objeto com o cadastro do curriculo armazenado
                    if (option.equals("1")) {
                        //Cadastra a vaga de emprego
                        Requests.sendPOST("POST","http://localhost:4000/api/vaga_de_emprego", "{\"vaga_de_emprego\": {\"area_da_vaga\":\" " + area_da_vaga + "\", \"salario_pago\": \"" +  salario_pago  +"\", \"contato_empresa\": \""  + salario_pago+ "\", \"nome_empresa\":\" "+ nome_empresa +" \", \"cnpj\":\" "+ cnpj+" \", \"carga_horaria\":\""+ carga_horaria+"\"}}");
                        System.out.println("Vaga de Emprego Salvo");
                    }
                    //Lista as vagas de emprego armazenada no servidor
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem das Vagas de Emprego: ");
                    //Retorna o vetor com os objetos curriculos salvos no servidor
                    Requests.sendGET("http://localhost:4000/api/vaga_de_emprego");
                    System.out.println("|-------------------------------------------------------------------------------|");

                }else if (option.equals("2")) {
                    //Lista as vagas de emprego armazenada no servidor
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem das Vagas de emprego: ");
                    //Retorna o vetor com os objetos curriculos salvos no servidor
                    Requests.sendGET("http://localhost:4000/api/vaga_de_emprego");
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Conectado ao servidor de vagas de emprego");
                    System.out.println("id: ");
                    String id = myObj.nextLine();  // Read user input
                    System.out.println("CNPJ: ");
                    String cnpj = myObj.nextLine();  // Read user input
                    System.out.println("Nome da Empresa: ");
                    String nome_empresa = myObj.nextLine();  // Read user input
                    System.out.println("Area da vaga: ");
                    String area_da_vaga = myObj.nextLine();  // Read user input
                    System.out.println("Salario Pago: ");
                    String salario_pago = myObj.nextLine();  // Read user input
                    System.out.println("Carga horaria: ");
                    String carga_horaria = myObj.nextLine();  // Read user input
                    System.out.println("Contato Empresa: ");
                    String contato_empresa = myObj.nextLine();  // Read user input
                    //Caso seja para alterar a vaga de emprego
                    Requests.sendPOST("PUT","http://localhost:4000/api/vaga_de_emprego/" + id, "{\"vaga_de_emprego\": {\"area_da_vaga\":\" " + area_da_vaga + "\", \"salario_pago\": \"" +  salario_pago  +"\", \"contato_empresa\": \""  + salario_pago+ "\", \"nome_empresa\":\" "+ nome_empresa +" \", \"cnpj\":\" "+ cnpj+" \", \"carga_horaria\":\""+ carga_horaria+"\"}}");
                    //Lista as vagas de emprego armazenada no servidor
                    System.out.println("Vaga de Emprego Alterada");
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem das Vagas de emprego: ");
                    //Retorna o vetor com os objetos curriculos salvos no servidor
                    Requests.sendGET("http://localhost:4000/api/vaga_de_emprego");
                    System.out.println("|-------------------------------------------------------------------------------|");
                }else if (option.equals("3") || option.equals("4")) {
                    if (option.equals("3")) {
                        //Lista as vagas de emprego armazenada no servidor
                        System.out.println("|-------------------------------------------------------------------------------|");
                        System.out.println("Listagem dos Curriculos: ");
                        //Retorna o vetor com os objetos curriculos salvos no servidor
                        Requests.sendGET("http://localhost:4000/api/curriculos");
                        System.out.println("|-------------------------------------------------------------------------------|");

                        System.out.println("Digite o id da vaga em que deseja consultar: ");
                        String id = myObj.nextLine();  // Read user input
                        //Consulta curriculos do servidor e /retorna objeto curriculo
                        Requests.sendGET("http://localhost:4000/api/curriculos/"+ id);

                    }
                }
            } catch (RemoteException e) {
                System.out.println("allShapes: " + e.getMessage());
            } catch (Exception e) {
                System.out.println("Lookup: " + e.getMessage());
            }
        }
    }
}


