package qrcode;



import com.onbarcode.barcode.IBarcode;
import com.onbarcode.barcode.QRCode;

public class GeneradorDeQR {

	private String path;
	private String contenido;
	private String nombreArchivo;
	public GeneradorDeQR (int idreserva,String path){
		
		this.path =  path;
		this.contenido = "http://192.168.1.128:8080/ProyectoLocal/datosreserva/"+idreserva+".html";
		this.nombreArchivo = "QR_"+idreserva+".png";
	}

	public void creea(){
		QRCode barcode = new QRCode();
		/*
		   QR Code Valid data char set:
		        numeric data (digits 0 - 9);
		        alphanumeric data (digits 0 - 9; upper case letters A -Z; nine other characters: space, $ % * + - . / : );
		        byte data (default: ISO/IEC 8859-1);
		        Kanji characters
		*/
		barcode.setData(contenido);
		barcode.setDataMode(QRCode.M_AUTO);
		barcode.setVersion(10);
		barcode.setEcl(QRCode.ECL_M);
	//  Set the processTilde property to true, if you want use the tilde character "~" to specify special characters in the input data. Default is false.
		//  1-byte character: ~ddd (character value from 0 ~ 255)
		//  ASCII (with EXT): from ~000 to ~255
		//  2-byte character: ~6ddddd (character value from 0 ~ 65535)
		//  Unicode: from ~600000 to ~665535
		//  ECI: from ~7000000 to ~7999999
		//  SJIS: from ~9ddddd (Shift JIS 0x8140 ~ 0x9FFC and 0xE040 ~ 0xEBBF)
		barcode.setProcessTilde(false);
		
		// QR Code unit of measure for X, Y, LeftMargin, RightMargin, TopMargin, BottomMargin
		barcode.setUom(IBarcode.UOM_PIXEL);
		// QR Code barcode module width in pixel
		barcode.setX(3f);
		
		barcode.setLeftMargin(10f);
		barcode.setRightMargin(10f);
		barcode.setTopMargin(10f);
		barcode.setBottomMargin(10f);
		// barcode image resolution in dpi
		barcode.setResolution(72);
		
		System.out.println(path+nombreArchivo);
		try {
			barcode.drawBarcode(path+nombreArchivo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
