Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC5FC2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1E8206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1E8206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dtms.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32d2be9c;
	Sat, 4 Apr 2020 22:36:07 +0000 (UTC)
Received: from mail.systemhaus.net (mail.systemhaus.net [212.125.36.2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b3340d6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Apr 2020 16:36:17 +0000 (UTC)
Received: by mail.systemhaus.net (Postfix, from userid 91)
 id 4C050126D; Wed,  1 Apr 2020 18:44:27 +0200 (CEST)
Received: from [192.168.129.4] (minmor-gw.systemhaus.net [212.125.39.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.systemhaus.net (Postfix) with ESMTPS id 3DF3D1256
 for <wireguard@lists.zx2c4.com>; Wed,  1 Apr 2020 18:44:27 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Roman Chumakov <roman.chumakov@dtms.de>
Subject: SIP/SDP Issue
Message-ID: <16959081-aaec-9187-8893-8b627054ec2a@dtms.de>
Date: Wed, 1 Apr 2020 18:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="------------ms030309020609030200040600"
X-DTMS-Footer: 1
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:36:00 +0200
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

This is a cryptographically signed message in MIME format.

--------------ms030309020609030200040600
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

we have windows 7&10 sip client software which doesnt work properly at
all with wintun wireguard interface. As we found out, wireguard
interface ip address isnt recognised and isnt packet in sdp proto.
Could we do something here ?

regards
Roman




--------------ms030309020609030200040600
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
DBIwggX6MIIE4qADAgECAhEAjNV/cPeN4vx5V1Vwq6kcvDANBgkqhkiG9w0BAQsFADCBljEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBD
bGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0xOTA0MTUwMDAw
MDBaFw0yMDA0MTQyMzU5NTlaMIIBBTELMAkGA1UEBhMCREUxDjAMBgNVBBETBTU1MTE4MRgw
FgYDVQQIEw9SaGVpbmxhbmQtUGZhbHoxDjAMBgNVBAcTBU1haW56MRYwFAYDVQQJEw1UYXVu
dXNzdHIuIDU3MRIwEAYDVQQKEwlkdG1zIEdtYkgxLzAtBgNVBAsTJklzc3VlZCB0aHJvdWdo
IGR0bXMgR21iSCBFLVBLSSBNYW5hZ2VyMR8wHQYDVQQLExZDb3Jwb3JhdGUgU2VjdXJlIEVt
YWlsMRcwFQYDVQQDEw5Sb21hbiBDaHVtYWtvdjElMCMGCSqGSIb3DQEJARYWcm9tYW4uY2h1
bWFrb3ZAZHRtcy5kZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJt84Y7pcKzG
wMKFXmLKNz+MdqV0LKZpe5+nI6vA3uf49rc6czB3rG1A3QokuwC1gqPSO18V8PTkXsvUXiOs
mJQ8Qs4YA37AY8gJAxseftBanGWZwzWU9FkqCkcOBpTZbblUJFJYFWMndGZQKUqDATijnTy3
nRrhjiYqEdIW7A5uNiN6uRbsbfdBGKV6GrqpMqgLn4WC0sjgIBsHHSEBo3A55zPzF5WKgZoH
PLf+OKUK82yKFoLsSMA007BpfOmu0CAUOeQvoHQsMcP73BqN8tQsZ5R5IA9t/oVrbqxCoT5s
LsLnlituSjhYuK1k8AYA8P+jrb4Lw+jHMtK/qKRKbUsCAwEAAaOCAc8wggHLMB8GA1UdIwQY
MBaAFAnA8vwL2pTbX/4r36iZQs/J4K0AMB0GA1UdDgQWBBRBbwMWhG06R2v0yi/IMMbKbz6F
OzAOBgNVHQ8BAf8EBAMCBaAwDAYDVR0TAQH/BAIwADAdBgNVHSUEFjAUBggrBgEFBQcDBAYI
KwYBBQUHAwIwQAYDVR0gBDkwNzA1BgwrBgEEAbIxAQIBAQEwJTAjBggrBgEFBQcCARYXaHR0
cHM6Ly9zZWN0aWdvLmNvbS9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJaHR0cDovL2NybC5zZWN0
aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENB
LmNybDCBigYIKwYBBQUHAQEEfjB8MFUGCCsGAQUFBzAChklodHRwOi8vY3J0LnNlY3RpZ28u
Y29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNlY3VyZUVtYWlsQ0EuY3J0
MCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTAhBgNVHREEGjAYgRZyb21h
bi5jaHVtYWtvdkBkdG1zLmRlMA0GCSqGSIb3DQEBCwUAA4IBAQCsN64lua5I87W1w2qXHwZz
SNZMHgLN1H7bGvxlaNrhdxKJ+5PcYBIU4eH8p09DGEz7kpTn7S7lEOEjWgYX/WYAQPqkFgaZ
RqU411AnSKvgiO8AgTF51bcWcMIou6bRpyL8gI1r/8jq/JVH9/FP8hsbdG2t5dXHOQ8yFP0X
I7iECFwLXaAwl66us6xjkngSrHphnMSsFOnYeXrhJBumdBmPGzeGT57v9J4/1vetPJp2adAa
EiRySNu27zNKcVSAFkYfO6bxw/nxrtWi6HxcOND4VClLnbIPXC5gZDNEg3aHtILWf1919t23
yh1BEcEbuvPHaYjzAeVGMUHGEq8uQWQGMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisG
TzANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsx
LjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgx
MTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdy
ZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBM
aW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQK
Qf/e+Ua56NY75tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbaz
Gl6nBEibivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9W
Aa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3n
dD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1Ud
IwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULP
yeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggr
BgEFBQcDAgYIKwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGG
P2h0dHA6Ly9jcmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0
aG9yaXR5LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0
cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6V
bTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQN
RsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lK
zcT+mLO1NLGWMeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZ
kNoVkDQ5CSSF8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG
+d9yZX3lB8bwc/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp
+3KyLTZGXq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE1
9GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY
0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWY
LcAi14ACHuVvJsmzNicxggQ1MIIEMQIBATCBrDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgT
EkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGln
byBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24g
YW5kIFNlY3VyZSBFbWFpbCBDQQIRAIzVf3D3jeL8eVdVcKupHLwwDQYJYIZIAWUDBAIBBQCg
ggJZMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDQwMTE2
NDQyN1owLwYJKoZIhvcNAQkEMSIEIAAZ0ioFaJb9yTKKqIJhLwSWhYZv3clKApqRTQvpBz7t
MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0D
BzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwIC
ASgwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0
ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1p
dGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNl
Y3VyZSBFbWFpbCBDQQIRAIzVf3D3jeL8eVdVcKupHLwwgb8GCyqGSIb3DQEJEAILMYGvoIGs
MIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQH
EwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAjNV/cPeN
4vx5V1Vwq6kcvDANBgkqhkiG9w0BAQEFAASCAQB6a/KrFSBP7rafW51aucnf6oEQZ0OW92oH
e1XwY73D37C+MHWpXNJgF4f3kJ1NGwdV7djVQospWcOMS0rJ8BU8PdjPqhZdD1FaB3tpf06S
2R9Sxw24k3hbME7ViEiE6jMnvAxjSJcjRPcmP/sVRPzE8XKIGeoIGzmBtO1CLGkpI9bMY5oh
T7tyrR4aq7fr1eSVRQzuW9xh1yP4K7CCEcljOvb//k+4cIVDpoEfrO7YxFMFn4NgW2ey0ONu
e+4ujhRp/oUkA+Ix6+YSeQirxiTfpaVUltNIichZ8ebltzkH9ll+QQJLJQLbTLTMjco3syiI
Pim0zDJEAW0wowO05wIAAAAAAAAA
--------------ms030309020609030200040600--
