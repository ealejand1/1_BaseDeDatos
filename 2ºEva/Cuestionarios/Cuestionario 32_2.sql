select matricula,marca,modelo from automoviles where matricula in (select matricula from propietarios where substring(DNI,8,1) != 3) and ((substring(matricula,5,1) like "C" and right(matricula,1) like "B") and (substring(matricula,6,1) like "M" or substring(matricula,6,1) like "N")) or ((substring(matricula,5,1) like "B" and right(matricula,1) like "C") and (substring(matricula,6,1) like "M" or substring(matricula,6,1) like "N"));




select matricula from propietarios where substring(DNI,8,1) = 3;
