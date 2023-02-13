

select matricula from automoviles where locate(left(matricula,1),right(matricula,6)) > 0;

select substring(matricula,5,length(matricula)) from automoviles; //matriculas letras
