
import utils.Requests;

import java.util.Scanner;  // Import the Scanner class

import java.rmi.*;

public class ClientCurriculo {
    public static void main(String[] args) {
        Scanner options = new Scanner(System.in);  // Create a Scanner object
        String option = "0";
        //Loopim do menu
        while (!option.equals("4")) {
            System.out.println("Digite 1 para CADASTRAR Curriculo");
            System.out.println("Digite 2 para ALTERAR curriculo cadastrado");
            System.out.println("Digite 3 para CONSULTAR as vagas de emprego");
            System.out.println("Digite 4 para sair");
            option = options.nextLine();
            Scanner myObj = new Scanner(System.in);  // Create a Scanner object
            try {
                if ((option.equals("1"))) {
                    System.out.println("CPF: ");
                    String cpf = myObj.nextLine();  // Read user input
                    System.out.println("Nome: ");
                    String nome_candidato = myObj.nextLine();  // Read user input
                    System.out.println("Area de interesse: ");
                    String area_de_interesse = myObj.nextLine();  // Read user input
                    System.out.println("Salario pretendido: ");
                    String salario_pretendido = myObj.nextLine();  // Read user input
                    System.out.println("Carga horaria: ");
                    String carga_horaria = myObj.nextLine();  // Read user input
                    System.out.println("Contato candidato: ");
                    String contato_candidato = myObj.nextLine();  // Read user input
                    //Caso a opção 1 foi escolhida
                    if (option.equals("1")) {
                        Requests.sendPOST("POST","http://localhost:4000/api/curriculos", "{\"curriculos\": {\"area_de_interesse\":\" " + area_de_interesse + "\", \"salario_pretendido\": \"" +  salario_pretendido  +"\", \"contato_candidato\": \""  + contato_candidato+ "\", \"nome_candidato\":\" "+ nome_candidato +" \", \"cpf\":\" "+ cpf+" \", \"carga_horaria\":\""+ carga_horaria+"\"}}");
                        System.out.println("Curriculo salvo");
                    }
                    //Lista os curriculos armazenados no servidor
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem dos Curriculos: ");
                    Requests.sendGET("http://localhost:4000/api/curriculos");
                    System.out.println("|-------------------------------------------------------------------------------|");

                } else if (option.equals("2")){
                    //Lista os curriculos armazenados no servidor
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem dos Curriculos: ");
                    Requests.sendGET("http://localhost:4000/api/curriculos");
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("id: ");
                    String id = myObj.nextLine();  // Read user input
                    System.out.println("CPF: ");
                    String cpf = myObj.nextLine();  // Read user input
                    System.out.println("Nome: ");
                    String nome_candidato = myObj.nextLine();  // Read user input
                    System.out.println("Area de interesse: ");
                    String area_de_interesse = myObj.nextLine();  // Read user input
                    System.out.println("Salario pretendido: ");
                    String salario_pretendido = myObj.nextLine();  // Read user input
                    System.out.println("Carga horaria: ");
                    String carga_horaria = myObj.nextLine();  // Read user input
                    System.out.println("Contato candidato: ");
                    String contato_candidato = myObj.nextLine();  // Read user input
                    Requests.sendPOST("PUT","http://localhost:4000/api/curriculos/" + id, "{\"curriculos\": {\"area_de_interesse\":\" " + area_de_interesse + "\", \"salario_pretendido\": \"" +  salario_pretendido  +"\", \"contato_candidato\": \""  + contato_candidato+ "\", \"nome_candidato\":\" "+ nome_candidato +" \", \"cpf\":\" "+ cpf+" \", \"carga_horaria\":\""+ carga_horaria+"\"}}");
                    //Caso seja o 2 altera o curriculo
                    System.out.println("Curriculo Alterado");
                    //Lista os curriculos armazenados no servidor
                    System.out.println("|-------------------------------------------------------------------------------|");
                    System.out.println("Listagem dos Curriculos: ");
                    Requests.sendGET("http://localhost:4000/api/curriculos");
                    System.out.println("|-------------------------------------------------------------------------------|");

                }else if (option.equals("3") || option.equals("4")) {
                    System.out.println("Conectado no servidor de vagas de emprego");
                    //Caso seja a opção 3 de consultar vagas de emprego de seu interesse
                    if (option.equals("3")) {
                        //Lista as vagas de emprego armazenada no servidor
                        System.out.println("|-------------------------------------------------------------------------------|");
                        System.out.println("Listagem das Vagas de Emprego: ");
                        //Retorna o vetor com os objetos curriculos salvos no servidor
                        Requests.sendGET("http://localhost:4000/api/vaga_de_emprego");
                        System.out.println("|-------------------------------------------------------------------------------|");

                        System.out.println("Digite o id da vaga em que deseja consultar: ");
                        String id = myObj.nextLine();  // Read user input
                        //Consulta curriculos do servidor e /retorna objeto curriculo
                        Requests.sendGET("http://localhost:4000/api/vaga_de_emprego/"+ id);

                        System.out.println("|-------------------------------------------------------------------------------|");
                        System.out.println("Listagem das Vagas de Emprego: ");
                        //Retorna o vetor com os objetos curriculos salvos no servidor
                        Requests.sendGET("http://localhost:4000/api/vaga_de_emprego");
                        System.out.println("|-------------------------------------------------------------------------------|");

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


