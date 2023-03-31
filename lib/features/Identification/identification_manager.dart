import 'dart:async';
import 'dart:convert';
import 'package:carryvibeapp/features/Identification/model/identification_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';

class IdentityManager {
  static IdentityManager? _instance;
  static IdentityManager get instance {
    _instance ??= IdentityManager._init();
    return _instance!;
  }

  Uri get _baseUri => Uri.parse("https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx");

  IdentityManager._init();


  Future<String?> getCheck({required IdentificationRequestModel model}) async {
    Xml2Json forConversion = Xml2Json();
    String soap = '''<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <TCKimlikNoDogrula xmlns="http://tckimlik.nvi.gov.tr/WS">
      <TCKimlikNo>${model.identityNumber}</TCKimlikNo>
      <Ad>${model.name}</Ad>
      <Soyad>${model.surname}</Soyad>
      <DogumYili>${model.birthYear}</DogumYili>
    </TCKimlikNoDogrula>
  </soap:Body>
</soap:Envelope>''';
    Response webReply = await http.post(
      _baseUri,
      headers: {
        'Host': 'tckimlik.nvi.gov.tr',
        'Content-Type': 'text/xml; charset=utf-8',
        'Content-Length': utf8.encode(soap).length.toString(),
        'SOAPAction': 'http://tckimlik.nvi.gov.tr/WS/TCKimlikNoDogrula',
      },
      body: utf8.encode(soap),
    );

    forConversion.parse(webReply.body);
    String jsonString = forConversion.toParker();
    Map mainData = (jsonDecode(jsonString) as Map);
    dynamic dataSent =
        mainData["soap:Envelope"]["soap:Body"]["TCKimlikNoDogrulaResponse"]["TCKimlikNoDogrulaResult"];

    return dataSent.toString();
  }
}