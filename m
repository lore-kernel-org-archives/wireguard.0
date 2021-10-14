Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9AAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 07:19:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F5260ED4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 07:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7F5260ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eutampieri.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 345bfaed;
	Thu, 14 Oct 2021 07:19:46 +0000 (UTC)
Received: from mail.eutampieri.eu (mail.eutampieri.eu
 [2001:41d0:701:1100::183])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c549956
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 07:19:45 +0000 (UTC)
Received: from smtpclient.apple (unknown [IPv6:2001:470:cb2b:2::6])
 by mail.eutampieri.eu (Postfix) with ESMTPSA id EE3033E928;
 Thu, 14 Oct 2021 09:19:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eutampieri.eu;
 s=mail; t=1634195985;
 bh=oMPlP9ewi91AIRP5qRYgYu30kikxZGBjmByZLbvdsVM=;
 h=From:Date:Subject:Cc:To:From;
 b=WzLwF5MdyXjn5GkbkeoSHoyQGorzzSGPnVRSt7xpmuwcfIWQB6OE0jfnAwhiBEUh7
 in5Oiiivh0BX/2oEzrxt/ZLkdj8oRIgtXsJDlmyRZ9qlvKbESeN/wMkGHFV6sjXz8a
 KMisRXFGjqCN5yBcKCtNyDcHE7Q8qU++pWMNVtJ0=
Content-Type: multipart/signed;
 boundary=Apple-Mail-E7370242-478E-45DA-B167-52F5C7C7369A;
 protocol="application/pkcs7-signature"; micalg=sha-256
Content-Transfer-Encoding: 7bit
From: Eugenio Tampieri <eugenio@eutampieri.eu>
Mime-Version: 1.0 (1.0)
Date: Thu, 14 Oct 2021 09:19:43 +0200
Subject: Re: wireguard-apple localization
Message-Id: <BCF80CA9-7681-4A1F-8F6F-26763779D554@eutampieri.eu>
Cc: wireguard@lists.zx2c4.com
To: Eiji Tanioka <tanioka404@gmail.com>
X-Mailer: iPad Mail (18H17)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--Apple-Mail-E7370242-478E-45DA-B167-52F5C7C7369A
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve had a look at Crowdin and I=E2=80=99ve contributed a few string=
s. However, crowdin is missing a few strings, such as tunnelStatusAddendumOn=
Demand and tunnelListCaptionOnDemand.
Kindly,

Eugenio Tampieri

> Il giorno 14 ott 2021, alle ore 05:55, Eiji Tanioka <tanioka404@gmail.com>=
 ha scritto:
>=20

--Apple-Mail-E7370242-478E-45DA-B167-52F5C7C7369A
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCBegw
ggXkMIIDzKADAgECAhAavN5rZCYNE9BMzaIZsHwuMA0GCSqGSIb3DQEBCwUAMIGBMQswCQYDVQQG
EwJJVDEQMA4GA1UECAwHQmVyZ2FtbzEZMBcGA1UEBwwQUG9udGUgU2FuIFBpZXRybzEXMBUGA1UE
CgwOQWN0YWxpcyBTLnAuQS4xLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9u
IENBIEczMB4XDTIwMDkyMzE5MjEwNFoXDTIxMDkyMzE5MjEwNFowIDEeMBwGA1UEAwwVZXVnZW5p
b0BldXRhbXBpZXJpLmV1MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlF0SGNF0ELeE
XyVLKu5x7TeIJSfmB96vS0gWDFnc83OQFdJtpBk9VLYN5BNbZg6vo0pKNad2z+hdIcf0RAG8zcUh
6winA3f0HqnI5zg4WfGXKyqd3Dpe6Me5luFpi6u1bsvooh7WRMw1hYA5t+9fIvF/P4OuuHwPDYBP
F5+du/PW1PRjGYEFgawMvUyeAxnjrlBMbZ9k4uzFzwwEaDRx4SEuN1omVESG8jrtkWudDJ5o1XhD
/20KTc2AWFcX/yF5/5YuJEHXuT0AynKhNZW2PRLBC3legMomXNLrnAcoIZIOmkWcjLE0MGtLQYny
rl45njDR8VElCLn1hQX0I1a0pQIDAQABo4IBtjCCAbIwDAYDVR0TAQH/BAIwADAfBgNVHSMEGDAW
gBS+l6mqhL+AvxBTfQky+eEuMhvPdzB+BggrBgEFBQcBAQRyMHAwOwYIKwYBBQUHMAKGL2h0dHA6
Ly9jYWNlcnQuYWN0YWxpcy5pdC9jZXJ0cy9hY3RhbGlzLWF1dGNsaWczMDEGCCsGAQUFBzABhiVo
dHRwOi8vb2NzcDA5LmFjdGFsaXMuaXQvVkEvQVVUSENMLUczMCAGA1UdEQQZMBeBFWV1Z2VuaW9A
ZXV0YW1waWVyaS5ldTBHBgNVHSAEQDA+MDwGBiuBHwEYATAyMDAGCCsGAQUFBwIBFiRodHRwczov
L3d3dy5hY3RhbGlzLml0L2FyZWEtZG93bmxvYWQwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUF
BwMEMEgGA1UdHwRBMD8wPaA7oDmGN2h0dHA6Ly9jcmwwOS5hY3RhbGlzLml0L1JlcG9zaXRvcnkv
QVVUSENMLUczL2dldExhc3RDUkwwHQYDVR0OBBYEFGD9/A29ewH+sy58UYH0ELSr3G6FMA4GA1Ud
DwEB/wQEAwIFoDANBgkqhkiG9w0BAQsFAAOCAgEAyHU3yxGmMDaYnElJk7rHuhZi2ryC9/MIoUrJ
t37DxHJKFnWsipnr/cIiw1pTRro9T/jZ3rOHG3wSOLfuoPV4jXw9RGLE+GCvlMekASIEkWk07Gp8
1RcHDr1odkMsQaDt+6TXniLqnd4qxv1axt7LlpWW5fctJdWGTvXpP1szWlmYK12rOk+iY7xgLL2F
i+BG3g0935LCpZVmFz1U7stHAaImRrV5/Z27kV2uEimu9fmA+Dv3pGc6S3rVFzAD5TVAlW0N2bT/
Bqurnl87cG1WVclyjU+aTXLw1cGjSPBbGpfIwyHc6lXcOlLteEcFZMe+Aah/wiKo6ijCLlGpe86S
vUP3JESXEh9ErwQJ1Ksz01V4bzoILQRjyTsenCR3yyeDHhrQIYdHsERorUVjPxvbMpbtXALHpvjw
NqaSS17mNCXipXQ/Vg9UIwjOPef7H/b9IKS2Rpr+iDaA/AudhGAYamh2TmkCzOpIIwX0nYvzdR48
ScYcI0Rxl1hSHKSLh8LHbAlv0iN9q535RWXxeMsda7dAwlleZ+h7RMeLn80a3nD1FAYsM5sU0BS2
JaEZnUYaJWBFHivLmAaFo/oSUgTQbhRBW9R14zb0Jnd8rAZ61BeDM3zIdkevo8hyPWxEufKZSLiO
x5LSSQQ0NU87TOaL+LiV1Xpmkbry4kBQVnFgJ20xggOFMIIDgQIBATCBljCBgTELMAkGA1UEBhMC
SVQxEDAOBgNVBAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8xFzAVBgNVBAoM
DkFjdGFsaXMgUy5wLkEuMSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBD
QSBHMwIQGrzea2QmDRPQTM2iGbB8LjANBglghkgBZQMEAgEFAKCCAb8wGAYJKoZIhvcNAQkDMQsG
CSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjExMDE0MDcxOTQzWjAvBgkqhkiG9w0BCQQxIgQg
r2ztMErNqp7EGe+4zXiufW5r8o2g2zd25UC94vzkW+4wgacGCSsGAQQBgjcQBDGBmTCBljCBgTEL
MAkGA1UEBhMCSVQxEDAOBgNVBAgMB0JlcmdhbW8xGTAXBgNVBAcMEFBvbnRlIFNhbiBQaWV0cm8x
FzAVBgNVBAoMDkFjdGFsaXMgUy5wLkEuMSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50
aWNhdGlvbiBDQSBHMwIQGrzea2QmDRPQTM2iGbB8LjCBqQYLKoZIhvcNAQkQAgsxgZmggZYwgYEx
CzAJBgNVBAYTAklUMRAwDgYDVQQIDAdCZXJnYW1vMRkwFwYDVQQHDBBQb250ZSBTYW4gUGlldHJv
MRcwFQYDVQQKDA5BY3RhbGlzIFMucC5BLjEsMCoGA1UEAwwjQWN0YWxpcyBDbGllbnQgQXV0aGVu
dGljYXRpb24gQ0EgRzMCEBq83mtkJg0T0EzNohmwfC4wDQYJKoZIhvcNAQELBQAEggEAB7pU+ACz
JVa3UNIInkhn4aZTWwf6VJ/FnBK9XEu74k80+jf4h1qmnFf00SeoPnPYO+17fBM9ENx93FmrCRbn
XWeJu5v4/1V/dW80tXh1NZ5GFffsbbDw1IwNsIiCNanQOTj3VBhlZkCFDu9jiL9jvuF4sdP0VUku
OmPNZgiBLs09Mn8xLNrhU9GBw6thWfDaXyZIB28MXyRa1MS3fiW7p56CyPTh6KeW+HBv/mK0igX3
U/6w1Dk9p2Do6PuKXy6X9JTZUGdqufO/D9M9aUgSwdoHB2gxSIPKBnXdHfmEYvZjD6Y3cwgq34Nj
07L3rAOcA/sqeRISqNtmRJE3APs7xgAAAAAAAA==

--Apple-Mail-E7370242-478E-45DA-B167-52F5C7C7369A--
