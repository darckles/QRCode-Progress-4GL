/*
****** Autor: Darckles Almeida
****** Data: 14/03/2016
****** Objetivo: Gerar QRCODE via Progress 4GL.
*/

USING ThoughtWorks.QRCode.Codec.*.
USING System.Drawing.*.

    DEF VAR i-ix            AS INT.
    DEF VAR c-local         AS CHAR.
    DEF VAR c-arquivo       AS CHAR INITIAL "Qrcode.png".
     
    DEFINE VARIABLE c-QrCode AS ThoughtWorks.QRCode.Codec.QRCodeEncoder NO-UNDO.
    DEFINE VARIABLE c-imagem  AS System.Drawing.Image  NO-UNDO.
    
    
        REPEAT i-ix = 1 TO (NUM-ENTRIES(FILE-INFO:FILE-NAME,'\') - 1):  
                ASSIGN c-local    =  c-local + '\' + ENTRY(i-ix, FILE-INFO:FILE-NAME,'\').
        END.
            
        ASSIGN  c-local = SUBSTRING(c-local,2,500)
                c-local = c-local + "\" + c-arquivo.
         
        c-QrCode = NEW QRCodeEncoder().
            c-QrCode:QRCodeVersion = 0.
            c-imagem = c-QrCode:Encode("Funciou o Teste de QRCODE \o/.  Detalhes sobre o Desenvolvimento : http://www.4each.com.br/threads/fwqrcode.16613/").
            DELETE OBJECT c-QrCode.
            c-imagem:Save(c-local,System.Drawing.Imaging.ImageFormat:png).
    
          
        OS-COMMAND SILENT VALUE(c-local).



