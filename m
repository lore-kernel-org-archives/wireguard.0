Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E9EC636D4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Feb 2023 12:54:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d237270e;
	Wed, 15 Feb 2023 12:54:08 +0000 (UTC)
Received: from mx4.ernw.net (mx4.ernw.net [185.144.92.199])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80a45151
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2023 12:54:06 +0000 (UTC)
Received: from mail1.ernw.net (mail1.ernw.net [172.31.1.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mail1.ernw.net", Issuer "ernw ca1" (verified OK))
 by mx4.ernw.net (Postfix) with ESMTPS id 4CC2C4436
 for <wireguard@lists.zx2c4.com>; Wed, 15 Feb 2023 13:54:06 +0100 (CET)
Received: from [IPV6:fd00:2001:0:cf20::1017] (unknown
 [IPv6:fd00:2001:0:cf20::1017])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "Florian Bausch",
 Issuer "SwissSign Personal Gold CA 2014 - G22" (verified OK))
 by mail1.ernw.net (Postfix) with ESMTPSA id 387C6333073
 for <wireguard@lists.zx2c4.com>; Wed, 15 Feb 2023 13:54:06 +0100 (CET)
Message-ID: <5dd37668-9c40-38a9-4655-199d0f11b4d9@ernw.de>
Date: Wed, 15 Feb 2023 13:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] wg-tools: Fix too strict file permissions on resolv.conf
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <90cadce0-51e9-d9f3-4b27-084f49e99f1c@ernw.de>
 <CAHmME9pd1W2sbY7FXMad2Qb_dh=f3307ACKOr9hAS5zfjRUEHQ@mail.gmail.com>
From: Florian Bausch <fbausch@ernw.de>
In-Reply-To: <CAHmME9pd1W2sbY7FXMad2Qb_dh=f3307ACKOr9hAS5zfjRUEHQ@mail.gmail.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-512; boundary="------------ms060706090309040000030404"
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

--------------ms060706090309040000030404
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I hardened my system by setting a strict umask of 077 in
/etc/login.defs. However, this breaks DNS as soon as wg-quick is used to
bring up a WireGuard tunnel. This is, because the strict umask value
will be applied to /etc/resolv.conf (at least if the DNS hatchet is
used) and therefore, unprivileged processes are not able to read
/etc/resolv.conf.

While the behavior can be worked around by setting umask in other
places, the fix below would prevent this behavior to occur. The umask
022 is applied before creating the new /etc/resolv.conf in the DNS hatchet.

Kind regards

Signed-off-by: Florian Bausch <fbausch@ernw.de>
---
  contrib/dns-hatchet/hatchet.bash | 1 +
  1 file changed, 1 insertion(+)

diff --git a/contrib/dns-hatchet/hatchet.bash 
b/contrib/dns-hatchet/hatchet.bash
index bc4d090..807a14a 100644
--- a/contrib/dns-hatchet/hatchet.bash
+++ b/contrib/dns-hatchet/hatchet.bash
@@ -20,6 +20,7 @@ set_dns() {
  		[[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf 'search %s\n' "${DNS_SEARCH[*]}"
  		} | unshare -m --propagation shared bash -c "$(cat <<-_EOF
  			set -e
+			umask 022
  			context="\$(stat -c %C /etc/resolv.conf 2>/dev/null)" || unset context
  			mount --make-private /dev/shm
  			mount -t tmpfs none /dev/shm
-- 
2.39.1

--------------ms060706090309040000030404
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCC
DgMwgga4MIIEoKADAgECAg8ZF5XcInQbEh3bVExcy9wwDQYJKoZIhvcNAQELBQAwRTELMAkG
A1UEBhMCQ0gxFTATBgNVBAoTDFN3aXNzU2lnbiBBRzEfMB0GA1UEAxMWU3dpc3NTaWduIEdv
bGQgQ0EgLSBHMjAeFw0xNDA5MTkxNDEwMjVaFw0yOTA5MTUxNDEwMjVaMFQxCzAJBgNVBAYT
AkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxLjAsBgNVBAMTJVN3aXNzU2lnbiBQZXJzb25h
bCBHb2xkIENBIDIwMTQgLSBHMjIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCe
t/RPYkWzHg09v5NQEic+C/2dTIX10wmHuxAvrofJusHZ16+o1zX4ar58VPi18Fr2Fsj7GpFG
oI7QuhA4ne/dcyU7NDfNMv5vfCAO+z93y1nstYY5JgXjzT+svVpoEhAWWsTrYYNC9yaQf8Lx
DGxJL5P6BrYVCEL8Gv9u2941w/pzPztbKyEXwhT/uw4piqHejmZvEjrjVHW7f7NqIarwD3rb
SlKhbdv0/Ux/m3jPnWJ+pv79Cxi0O3rR3D6ZURLqyTxyX1VEt6Ny6JcXJUlqPtjIhOKivfdu
7OF4e/Nl3FpBKB6rSYiu+Zeq2mVmipdDXaKtHvGG5//D1S0UFuoLAgMBAAGjggKUMIICkDAO
BgNVHQ8BAf8EBAMCAQYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQU2jL5SfhRzJhx
ZgzZzrbbkj8JS+8wHwYDVR0jBBgwFoAUWyV7lqRlUX64OfPAeGZe6Drn8O4wgf8GA1UdHwSB
9zCB9DBHoEWgQ4ZBaHR0cDovL2NybC5zd2lzc3NpZ24ubmV0LzVCMjU3Qjk2QTQ2NTUxN0VC
ODM5RjNDMDc4NjY1RUU4M0FFN0YwRUUwgaiggaWggaKGgZ9sZGFwOi8vZGlyZWN0b3J5LnN3
aXNzc2lnbi5uZXQvQ049NUIyNTdCOTZBNDY1NTE3RUI4MzlGM0MwNzg2NjVFRTgzQUU3RjBF
RSUyQ089U3dpc3NTaWduJTJDQz1DSD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/
b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnQwXwYDVR0gBFgwVjBUBglghXQBWQEC
AQYwRzBFBggrBgEFBQcCARY5aHR0cDovL3JlcG9zaXRvcnkuc3dpc3NzaWduLmNvbS9Td2lz
c1NpZ24tR29sZC1DUC1DUFMucGRmMIHGBggrBgEFBQcBAQSBuTCBtjBkBggrBgEFBQcwAoZY
aHR0cDovL3N3aXNzc2lnbi5uZXQvY2dpLWJpbi9hdXRob3JpdHkvZG93bmxvYWQvNUIyNTdC
OTZBNDY1NTE3RUI4MzlGM0MwNzg2NjVFRTgzQUU3RjBFRTBOBggrBgEFBQcwAYZCaHR0cDov
L29jc3Auc3dpc3NzaWduLm5ldC81QjI1N0I5NkE0NjU1MTdFQjgzOUYzQzA3ODY2NUVFODNB
RTdGMEVFMA0GCSqGSIb3DQEBCwUAA4ICAQCt69uoI48fq9rTHigRvhS+LJcnMiiSXkyNEAOU
YwMVdoqbnaZT4hmUn0+NyoGIReGOMPWhHy5XlpVFZcf5q4jomBBnPkv67ZrfT1sO7dtyKd4/
jm9n6cC6gO+6WbHaeqOWgI626tqSzvbvD+ccKjPvbd5gfjp+D/+r9rlCc6gF75YiJlZPvVNz
JxfiGJVw/BWoHne0v0gzap7ZtqWcKlkqitlZUdBdhZI7kwgFrD+Iw7AIKl+UNFTvlOu4c+N8
TgG7hT02bc0G3fNxznKRxDxlsnORYudKLYtjyvvVSVzePGrJY5lBuBLXjH8HNVCPhGT35fwq
i8amigAVUgFH9t1T/PYh1mUQ2Cg82kmiS4Qfk5LpRlLI2aGFeMjZAZef3Ub5BXj76St5XPqF
5U6EM+A6g59Fctgb07/3Co8y2GZRCBxOvKannts+kzTMhikfFwp/GGhimtB07cu5TUXbGRkT
a8UtZUH26AfNd3UAMgqusaAlc98yW5dP3ArwHNNwjlw6qERK3gDCrmr1+aJbc5QBE4vQJrRn
+xFBy+8n97CVm8t2zKZx+NXom03v8gGAgngP8mzgNFYLAC/WOEGIQaxECWGImZ6n/9TUcRpP
2it52309hLWIpuRwy4MS0+5hetD7w5CYwTAxs4VuhkwxM5U056csf4SIboFSejBPCqqO0DCC
B0MwggYroAMCAQICFBQ5jWSi0Wbld0Dp8u0TRTxw9qpvMA0GCSqGSIb3DQEBCwUAMFQxCzAJ
BgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxLjAsBgNVBAMTJVN3aXNzU2lnbiBQ
ZXJzb25hbCBHb2xkIENBIDIwMTQgLSBHMjIwHhcNMjEwMzA4MTAxMTIxWhcNMjQwMzA4MTAx
MTIxWjCBgDELMAkGA1UEBhMCREUxGzAZBgNVBAgMEkJhZGVuLVfDvHJ0dGVtYmVyZzEbMBkG
A1UEChMSRVJOVyBSZXNlYXJjaCBHbWJIMR4wHAYJKoZIhvcNAQkBFg9mYmF1c2NoQGVybncu
ZGUxFzAVBgNVBAMTDkZsb3JpYW4gQmF1c2NoMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIIC
CgKCAgEAv9+51yKRC01/VyoHwHAu5OhsQQ0V+Kq7MqeqxhpmEwsJw1e++r88F9Hhpb9Pb5xX
qHvAxaSR6ACChyXaMmQPH7REGOnnViT5EasmAC8vjSA8oow0FiGCa6ctteKDGbsjumb3CdR3
Y9jfJ6wwbKTtFk7petn3wkbmtSciL0MvXp4pR3OAyJNSnAWBqio71MQmM26GmaNdN4BfQvY3
w6a5bvtewwB4kKXlW4swkKhZibKa/Q+gJGvUeehvn90RCO7dqImif4Shi/r41PcKeozXhDAZ
qk7ItRVle6WUwpmd8ub3eSAjom12S/rm1Z1Efm7b9De4yC/KGmmq1vOYkUCpFKlHLWf5yy5r
f5CC32m7MfefM+73ug5U9a7Y0L8nkN4pwunesf4m1lJQ4asmFzXu52UO7e4UKQvEibDhDzmf
bl6Ytp3e54b8imFSBc6NXKN3CEFjL+VY/o5eslWKrII/6yUqDnSEj/ThTayRbXTD+wliTADn
SCgt3Z1xb2q7lCqJby+LNLJXHdDzmg9YRefPK4aZm6yj7pCDHjdBZgYNNUlteWacAEBW3OM3
uuaSwL5OHk4Pz1NRLSUFebz8LGqFAEsP8K0/0N67kD1cF6lblXKFOyUTbbKfCI6LQIl/H/LG
0bUJZfyeuc3VAIbedAvKyhQqavDV4Vq0hbpTlxLO5uMCAwEAAaOCAt4wggLaMBoGA1UdEQQT
MBGBD2ZiYXVzY2hAZXJudy5kZTAOBgNVHQ8BAf8EBAMCA/gwNQYDVR0lBC4wLAYIKwYBBQUH
AwIGCCsGAQUFBwMEBgorBgEEAYI3CgMEBgorBgEEAYI3FAICMB0GA1UdDgQWBBQ9h16uAU4i
lwa8mtXM+zm2l4PqIjAfBgNVHSMEGDAWgBTaMvlJ+FHMmHFmDNnOttuSPwlL7zCB/wYDVR0f
BIH3MIH0MEegRaBDhkFodHRwOi8vY3JsLnN3aXNzc2lnbi5uZXQvREEzMkY5NDlGODUxQ0M5
ODcxNjYwQ0Q5Q0VCNkRCOTIzRjA5NEJFRjCBqKCBpaCBooaBn2xkYXA6Ly9kaXJlY3Rvcnku
c3dpc3NzaWduLm5ldC9DTj1EQTMyRjk0OUY4NTFDQzk4NzE2NjBDRDlDRUI2REI5MjNGMDk0
QkVGJTJDTz1Td2lzc1NpZ24lMkNDPUNIP2NlcnRpZmljYXRlUmV2b2NhdGlvbkxpc3Q/YmFz
ZT9vYmplY3RDbGFzcz1jUkxEaXN0cmlidXRpb25Qb2ludDBqBgNVHSAEYzBhMFUGCWCFdAFZ
AQIBDjBIMEYGCCsGAQUFBwIBFjpodHRwczovL3JlcG9zaXRvcnkuc3dpc3NzaWduLmNvbS9T
d2lzc1NpZ24tR29sZC1DUC1DUFMucGRmMAgGBgQAj3oBATCBxgYIKwYBBQUHAQEEgbkwgbYw
ZAYIKwYBBQUHMAKGWGh0dHA6Ly9zd2lzc3NpZ24ubmV0L2NnaS1iaW4vYXV0aG9yaXR5L2Rv
d25sb2FkL0RBMzJGOTQ5Rjg1MUNDOTg3MTY2MENEOUNFQjZEQjkyM0YwOTRCRUYwTgYIKwYB
BQUHMAGGQmh0dHA6Ly9vY3NwLnN3aXNzc2lnbi5uZXQvREEzMkY5NDlGODUxQ0M5ODcxNjYw
Q0Q5Q0VCNkRCOTIzRjA5NEJFRjANBgkqhkiG9w0BAQsFAAOCAQEAjtxjGL22smnSmLkY4w1V
WM4w9OFPXmENm4YZfb5ZOKp3jOywGHL9RG9tjkYFYLY2pqy+F+HqFN3+SfbwoilD6MOwxuSg
2ttPmUYuH5evwVCnnZup8dZlUS8pgrXt6fAlTLN9UZKFF9FXKuy6rUa3e5h0DygcvdwmacFE
V+bieda8QPbh+szdPRsP2e/nYL+cve4ngAUIQDpNVDJJcRb/1Jg++WIUe4yNLAoj9upxOBOH
6KDufppot6Kd6MBimgKuhGCe/dcH7LV9SObC1+zi1SZK575AGnQR/ITaN2ahBss76tVG6ddo
uBAk+lK2auM8prUGbqlYehPVZ9wB/UTxozGCBI4wggSKAgEBMGwwVDELMAkGA1UEBhMCQ0gx
FTATBgNVBAoTDFN3aXNzU2lnbiBBRzEuMCwGA1UEAxMlU3dpc3NTaWduIFBlcnNvbmFsIEdv
bGQgQ0EgMjAxNCAtIEcyMgIUFDmNZKLRZuV3QOny7RNFPHD2qm8wDQYJYIZIAWUDBAIDBQCg
ggHzMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIzMDIxNTEy
NTQwNVowTwYJKoZIhvcNAQkEMUIEQBNI7hHX4CP45sZoO97zARNAcAAGdDQsbktk+d23J/V3
TT/4o4DtZGYuFEhwjt+yYUslPqI8e4D+2vpovgF1/mYwbAYJKoZIhvcNAQkPMV8wXTALBglg
hkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggq
hkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB7BgkrBgEEAYI3EAQxbjBsMFQx
CzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxTd2lzc1NpZ24gQUcxLjAsBgNVBAMTJVN3aXNzU2ln
biBQZXJzb25hbCBHb2xkIENBIDIwMTQgLSBHMjICFBQ5jWSi0Wbld0Dp8u0TRTxw9qpvMH0G
CyqGSIb3DQEJEAILMW6gbDBUMQswCQYDVQQGEwJDSDEVMBMGA1UEChMMU3dpc3NTaWduIEFH
MS4wLAYDVQQDEyVTd2lzc1NpZ24gUGVyc29uYWwgR29sZCBDQSAyMDE0IC0gRzIyAhQUOY1k
otFm5XdA6fLtE0U8cPaqbzANBgkqhkiG9w0BAQEFAASCAgCvZeWM3JeI9Wocy2NjRR/W8AQ2
iYNvPBqM0P+wESZR2WllqiWicw4SgopDV+GGpjeOMMSDh2BusMdkSZNHnh7RCmIGXTbguYwl
nNCIiyEia3duSYLgMA3pfB8sUpgUthrr7ad11GjVysuLvUhrVyv4fQYpKVPnqnjlT3p1PfH5
uXdOGU6cpmwQz50pFiD3NRCYky9YuqgRkq4Kp6914lSJTvQ2VzOotwG4QI8JTGm238d/6LcN
m7Vnlvvj0Krwd5ic4gQipk39QzVmW9l9GBjd2pMU/RJchZxpEVQe1R+DIa2MA+FrkiU0/QTg
2KkNwf9mAC9I17NNoBXMOHLsuZxtUU2WP/dhW894Pc2WmtSjYXWfEnqB2Kk9Fi2BTkqwzYxZ
QId3vwlNWGr5D9+JSO/Ok9UXijovROibnCAePNd3jCb3ZIHKhW7xCXfpiuea3ltHCBdOXHDP
D2YIzwYyGmFVp/rycC01OI2Aq1x7wbR7l4L7G5RlsTjq7Di3J6uKn6oatGNTUHExFwL2iJL8
RvPbeDT+f5wfJhhxn9U2XPt8Llyh4RhcooeMo8lGdeJVq6bhN6Nqyk2LjcKMWSwcU2YkMnV2
L4hyR+agcyPSSp75wHc52PNjAN41Gb9tihaIxpqg8WNWoVnPrGZkiuJqrjJ9PlFxTptMa0Op
9vaxb82K6gAAAAAAAA==
--------------ms060706090309040000030404--
