

//nfc读取
var NfcAdapter;  
var NdefRecord;  
var NdefMessage;  

//标识是否开始读取
let readyRead = true;
//回调函数
var readback;

function listenNFCStatus(readCallback) {  
	readback = readCallback;
	try{  
		var main = plus.android.runtimeMainActivity();  
		var Intent = plus.android.importClass('android.content.Intent');  
		var Activity = plus.android.importClass('android.app.Activity');  
		var PendingIntent = plus.android.importClass('android.app.PendingIntent');  
		var IntentFilter = plus.android.importClass('android.content.IntentFilter');  
		NfcAdapter = plus.android.importClass('android.nfc.NfcAdapter');  
		var nfcAdapter = NfcAdapter.getDefaultAdapter(main);  
		var intent = new Intent(main, main.getClass());  
		intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);  
		var pendingIntent = PendingIntent.getActivity(main, 0, intent, 0);  
		var ndef = new IntentFilter("android.nfc.action.TECH_DISCOVERED");  
		ndef.addDataType("*/*");  
		var intentFiltersArray = [ndef];  
		var techListsArray = [  
			["android.nfc.tech.IsoDep"],  
			["android.nfc.tech.NfcA"],  
			["android.nfc.tech.NfcB"],  
			["android.nfc.tech.NfcF"],  
			["android.nfc.tech.Nfcf"],  
			["android.nfc.tech.NfcV"],  
			["android.nfc.tech.NdefFormatable"],  
			["android.nfc.tech.MifareClassi"],  
			["android.nfc.tech.MifareUltralight"]  
		];  
		plus.globalEvent.addEventListener("newintent",  
			function() {  
				console.error('newintent');  
				setTimeout(handle_nfc_data1, 1000);  
			}, false);  
		plus.globalEvent.addEventListener("pause", function(e) {  
			if (nfcAdapter) {  
				nfcAdapter.disableForegroundDispatch(main);  
				console.log('pause');  
			}  
		}, false);  
		plus.globalEvent.addEventListener("resume", function(e) {  
			if (nfcAdapter) {  
				console.log('resume');  
				nfcAdapter.enableForegroundDispatch(main, pendingIntent, intentFiltersArray, techListsArray);  
			}  
		}, false);  
		nfcAdapter.enableForegroundDispatch(main, pendingIntent, intentFiltersArray, techListsArray);  
	}catch(e){  
		console.error(e);  
	}  
}  

function handle_nfc_data1()  
{  
	NdefRecord = plus.android.importClass("android.nfc.NdefRecord");  
	NdefMessage = plus.android.importClass("android.nfc.NdefMessage");  
	var main = plus.android.runtimeMainActivity();  
	var intent = main.getIntent();  
	console.log("action type:" + intent.getAction());  
	if("android.nfc.action.TECH_DISCOVERED" == intent.getAction()){  
		if(readyRead){  
			__read(intent);  
			// readyRead = false;  
		}  
	}  
}  
function showToast(msg){  
	plus.nativeUI.toast(msg);  
}  


function __read(intent){
	try{
		var content = "";
		var tag = plus.android.importClass("android.nfc.Tag");  
		tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);  
		var bytesId  = intent.getByteArrayExtra(NfcAdapter.EXTRA_ID);  
		console.log("bytesId:"+(bytesId)); 
		content +="卡片字节数组ID："+tag.getId()+"<br/>";  
		content +="卡片16进制ID："+ bytesToHexString(tag.getId())+"<br/>";  
		var tagid = reverseTwo(bytesToHexString(tag.getId()));  
		content +="卡片16进制翻转ID："+tagid+"<br/>";  
		content +="卡片10进制卡号："+parseInt(tagid, 16)+"<br/>";  
		console.log("content:"+content);
		readback(bytesToHexString(tag.getId())); 
	}catch(e){
		//TODO handle the exception
	}
	
}  

 function bytesToHexString(inarray){  
	var i, j, x;  
	var hex = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A",  
		"B", "C", "D", "E", "F" ];  
	var out = "";  
	for (j = 0; j < inarray.length; ++j) {  
		x = parseInt(inarray[j]) & 0xff;  
		i = (x >> 4) & 0x0f;  
		out += hex[i];  
		i = x & 0x0f;  
		out += hex[i];  
	}  
	return out;  
}  

function reverseTwo(str)   
{   

	var str1 = "";  
	for(var i = 1; i <= str.length; i++){  
		str1 +=str[i-1];  
		if(i%2==0){  
			if(i == str.length){  
				break;  
			}  
			str1+=":";  
		}  
	}  
	var str2 = "";  
	for(var i = str1.split(":").length-1; i >= 0 ; i--){  
		str2+= str1.split(":")[i];  
	}  
	return str2;  
}  



export default {listenNFCStatus}