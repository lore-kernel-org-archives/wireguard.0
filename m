Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1A0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 10:05:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742912250E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 10:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742912250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=glexia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca50efc;
	Tue, 5 Jan 2021 09:54:35 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa3779f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 01:50:21 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id w3so27971075otp.13
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 18:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glexia.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l3JZWDtSZCPkyS9b3OL6kYJohdBLvgLAD8xv8aPucaA=;
 b=irMwmGAtb3NoIEVaM0KEqQPakIK+r6/siRPOIxRhYfohcf/upVSJllilFosrdrFRG/
 iIiyGl+XRKxcpkqnClpkcswIcaMYp0uSIZwrQYefRcD1akZxUPrlx/bjXv6pigIw+wun
 ksi2C3G6kVlSK2pTjVaOCH54wsYXS20GoKZkUQC2szUs1Y0uyl85FAYQmB675QCjMpbm
 6gNwKK3cy5Z61Rwt/nsC80SiQSHlGRa1S1dw6vcl2EFR3mlImksf4JE3AcA38EPbOyTH
 wvCEB+nBCTQCAATQhxwabb/wwyRNdQkd5YHVVm8Paw57JgMHQgsUMujX3wDZLYADYta8
 SwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l3JZWDtSZCPkyS9b3OL6kYJohdBLvgLAD8xv8aPucaA=;
 b=G22V34gHY+DzQMPi/UNOkIXjabbuhDGlvja4n2RAHkqSOo6Lw0qrSxsK6fND2v97JS
 HH41Li+Qt7t84Hgm1m+3QL9Dxejthv+X55IZSa0eKr7YEotwyhEUl1quPddFELRuCyNf
 Z7sOlB6lq3sr6PnvvfKgSRM2sO5IxJypr5I2p9Wwxw8cw8Z9UuS8uOEhcflfutAD7UAL
 UF0ayA9CpbS/VpQkKhU4M2mQbAI+wt7mpBHezLPdAgWyCGxwB+l0cHZYQsxiqmiW5gqU
 p+7EqhKrBzlNCFinfgvhNbrnBTyMLeRE71Aybez9T8Aju1qIIKYuRA72Eyid42ekvjAg
 aDUg==
X-Gm-Message-State: AOAM531jJWIn688H5W5r2xbedKCUZGffgZNJucq9pVZfgvzaL6Z5ZmWt
 iN8jJJ/bP759cdbbeJqDKbVcVQsezZUoUR3/gydTmDelfnxEhUQD
X-Google-Smtp-Source: ABdhPJwdO0zlO7qZK0r1GkrihpfSidUT1XN/xDRYp3d6KpdywG4rlLHwLi67jnU5aF5PGv47UFV5XanjR+Qvq2HILfI=
X-Received: by 2002:a05:6830:1e41:: with SMTP id
 e1mr55091999otj.143.1609812075446; 
 Mon, 04 Jan 2021 18:01:15 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
 <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
 <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
In-Reply-To: <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
From: "Michael B. Williams" <Michael.Williams@glexia.com>
Date: Mon, 4 Jan 2021 21:00:39 -0500
Message-ID: <CAGj=18GrESw2rg3hj5K=T3rpEAEu8c8TQ1MX-jv1soeM6GTHfA@mail.gmail.com>
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: Adrian Larsen <alarsen@maidenheadbridge.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000f094c605b81d94bd"
X-Mailman-Approved-At: Tue, 05 Jan 2021 10:54:32 +0100
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

--000000000000f094c605b81d94bd
Content-Type: text/plain; charset="UTF-8"

I agree with this commentary and would second keeping the functionality.

________________________________

Michael B. Williams
Glexia, Inc. - An IT Company
USA Direct: +1 978 477 6797
USA Toll Free: +1 800 675 0297 x101
AUS Direct: +61 3 8594 2265
AUS Toll Free: +61 1800 931 724 x101
Fax: +1.815-301-5570
Michael.Williams@glexia.com
https://www.glexia.com/
https://www.glexia.com.au/

Legal Notice:
The information in this electronic mail message is the sender's
confidential business and may be legally privileged. It is intended
solely for the addressee(s). Access to this internet electronic mail
message by anyone else is unauthorized. If you are not the intended
recipient, any disclosure, copying, distribution or any action taken
or omitted to be taken in reliance on it is prohibited and may be
unlawful.


________________________________

Michael B. Williams
Glexia, Inc. - An IT Company
USA Direct: +1 978 477 6797
USA Toll Free: +1 800 675 0297 x101
AUS Direct: +61 3 8594 2265
AUS Toll Free: +61 1800 931 724 x101
Fax: +1.815-301-5570
Michael.Williams@glexia.com
https://www.glexia.com/
https://www.glexia.com.au/

Legal Notice:
The information in this electronic mail message is the sender's
confidential business and may be legally privileged. It is intended
solely for the addressee(s). Access to this internet electronic mail
message by anyone else is unauthorized. If you are not the intended
recipient, any disclosure, copying, distribution or any action taken
or omitted to be taken in reliance on it is prohibited and may be
unlawful.



On Mon, Jan 4, 2021 at 1:49 PM Adrian Larsen
<alarsen@maidenheadbridge.com> wrote:
>
> Hi Jason,
>
> 1) From a manual operation point of view, I feel more comfortable if an
> Operator uses:
>
> # wg set wg0 peer ... allowed-ips ...
> # wg-quick save wg0
>
> rather than editing manually the config file.
>
> In case the Wire Guard is running multiple peers with production
> traffic, I think an Operator can do less damage using the commands if
> something goes wrong.
>
> 2) From automation point of view, still I think that is easy to use the
> commands (on an script):
>
> # wg set wg0 peer ... allowed-ips ...
> # wg-quick save wg0
>
> rather than using "sed" or "awk" to modify the config file.
>
> My 2 cents.
>
> Adrian
>
> On 04/01/2021 16:16, Maarten de Vries wrote:
> > On 03-01-2021 20:59, Chris Osicki wrote:
> >> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
> >>> Hi,
> >>>
> >>> I was thinking recently that most people have switched from a model of
> >>> updating the runtime configuration and then reading that back into a
> >>> config file, to editing the config file and then syncing that with the
> >>> runtime config. In other words, people have moved from doing:
> >>>
> >>> # wg set wg0 peer ... allowed-ips ...
> >>> # wg-quick save wg0
> >>>
> >>> To doing:
> >>>
> >>> # vim /etc/wireguard/wg0.conf
> >>> # wg syncconf wg0 <(wg-quick strip wg0)
> >>>
> >>> I think this is mostly a positive change too in terms of reliability.
> >>> Reading back the runtime configuration was always a bit hit or miss,
> >>> and I suspect that more times than not people have been confused by
> >>> SaveConfig=true.
> >>>
> >>> That raises the question: are there good uses left for SaveConfig=true
> >>> and `wg-quick save` that warrant keeping the feature around?
> >>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
> >>> that?
> >>>
> >>> I haven't thought too deeply about this in order to be wedded to one
> >>> outcome over the other yet, but seeing some confusion today, again, in
> >>> #wireguard over the feature made me wonder.
> >>>
> >>> Any opinions on this? Any one on this list actively use this feature
> >>> and see replacements for it (e.g. syncconf) as clearly inferior?
> >>>
> >>> Jason
> >> Hi Jason
> >>
> >> Being an old fashioned Unix admin, ~30 years spent in this job, I
> >> vote for the traditional way of doing it:
> >> change the config file and let the application reread it.
> >> I think the KISS principle is still valid ;-)
> >
> > I totally agree. Reloading the config file is much nicer :)
> >
> > I also don't need to save roaming endpoints. All WireGuard tunnels I
> > use have at-least one side with a fixed endpoint. And if that's not
> > the case I imagine you probably need a more complicated solution than
> > wg-quick.
> >
> >
> >> Thanks for the excellent software, Jason!
> >
> > I also totally agree with this. WireGuard has made my life a lot
> > easier :)
> >
> >
> > Regards,
> >
> > Maarten
> >

--000000000000f094c605b81d94bd
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUygYJKoZIhvcNAQcCoIIUuzCCFLcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghHfMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCBiDELMAkG
A1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYD
VQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlm
aWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkG
A1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEY
MBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0
aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qO
TKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDyg
NfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/S
oY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3n
dD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQY
MBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAO
BgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2Bggr
BgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNv
bTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bj
grShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN
5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwpTf64ZNnX
UF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4
Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ
6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tP
C8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlak
dYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbD
OO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklh
NwZ+4uWYLcAi14ACHuVvJsmzNicwggXeMIIDxqADAgECAhAB/W0w/KPKUagbvGQONQMtMA0GCSqG
SIb3DQEBDAUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxML
SmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNF
UlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMDAyMDEwMDAwMDBaFw0zODAx
MTgyMzU5NTlaMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxML
SmVyc2V5IENpdHkxHjAcBgNVBAoTFVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNF
UlRydXN0IFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTCCAiIwDQYJKoZIhvcNAQEBBQADggIP
ADCCAgoCggIBAIASZRc2DsPbCLPQrFcNdu3NJ9NMrVCDYeKqIE0JLWQJ3M6Jn8w9qez2z8Hc8dOx
1ns3KBErR9o5xrw6GbRfpr19naNjQrZ28qk7K5H44m/Q7BYgkAk+4uh0yRi0kdRiZNt/owbxiBhq
kCI8vP4T8IcUe/bkH47U5FHGEWdGCFHLhhRUP7wz/n5snP8WnRi9UY41pqdmyHJn2yFmsdSbeAPA
UDrozPDcvJ5M/q8FljUfV1q3/875PbcstvZU3cjnEjpNrkyKt1yatLcgPcp/IjSufjtoZgFE5wFO
RlObM2D3lL5TN5BzQ/Myw1Pv26r+dE5px2uMYJPexMcM3+EyrsyTO1F4lWeL7j1W/gzQaQ8bD/Ml
JmszbfduR/pzQ+V+DqVmsSl8MoRjVYnEDcGTVDAZE6zTfTen6106bDVc20HXEtqpSQvf2ICKCZNi
jrVmzyWIzYS4sT+kOQ/ZAp7rEkyVfPNrBaleFoPMuGfi6BOdzFuC00yz7Vv/3uVzrCM7LQC/NVV0
CUnYSVgaf5I25lGSDvMmfRxNF7zJ7EMm0L9BX0CpRET0medXh55QH1dUqD79dGMvsVBlCeZYQi5D
Gky08CVHWfoEHpPUJkZKUIGy3r54t/xnFeHJV4QeD2PW6WK61l9VLupcxigIBCU5uA4rqfJMlxwH
Pw1S9e3vL4IPAgMBAAGjQjBAMB0GA1UdDgQWBBRTeb9aqitKz1SA4dibwJ3ysgNmyzAOBgNVHQ8B
Af8EBAMCAQYwDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQwFAAOCAgEAXNR8Dc/3AX1BmWUM
c8VSn8v4z5kGfxvaQxWfngJVV5YU8VI8J4eUKO0fOgE3onb8U1DAhJvGa066jCFPoo5VYpHzaRXY
vIjjxKoL/e+o6UtVKgYgbVV4KRnuXzBcSyQRVf8kmm5eKivuC02ff/cBOJQUlUMHCftgqe4cqxKM
oJpep5hqWW2LPwj7yNFFrxgVZJASD3MoLsXiJE78WOzw9EX+IrPrL47S2UVhBcGXb6h2co+LjDav
vw0FznGN5qZvH2ymcWLF2NCDcgzxZxGJDJwTTHI037zVcd+qcd3huWyMPBJdZdq9VxK2Q2v/5d5N
ZhFRz5mu7Be26HGRjN5J/t01caIVJ5Qcz2HjJrtvo2clIV3m3R0LLmgbO4Kv7INnhdSYUXSxuZmA
if9/eBlceUpgLpJArkw3KizJx2LIDl33NlvK4CUlAbTdGgecdwA/0NzV7D3U+rs/zIXWb3+pLd+5
Avf1l5q1NdrDZ7CHSqkoniOO/1wna+GwT/MH7gAu1FmHy1JBler0R9fuZEFVfI1ZApXdYp3Cue5a
KHSEpZu3kMcMB9/1iTZ0MtYowbCwC+CcTMMc1vzjabVHRoEvooKr02NEcMSN/y0zuq2Pe7VwiK4+
Gc9AKNj8yJC7XZki9VLmWMUfiDFD7ogd18aOPENqHacY3n09FvFi+cqQqP0wggXlMIIEzaADAgEC
AhEA00JUuuDNMe8XoSt+CH/zQjANBgkqhkiG9w0BAQsFADCBljELMAkGA1UEBhMCR0IxGzAZBgNV
BAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGln
byBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQTAeFw0yMDA1MTMwMDAwMDBaFw0yMjA1MTMyMzU5NTlaMIHsMQswCQYD
VQQGEwJVUzEOMAwGA1UEERMFMDE4NjAxFjAUBgNVBAgTDU1hc3NhY2h1c2V0dHMxETAPBgNVBAcT
CE1lcnJpbWFjMRcwFQYDVQQJEw4xIEhhbnNvbSBEcml2ZTEVMBMGA1UEChMMR2xleGlhLCBJbmMu
MSswKQYDVQQLEyJQZXJzb25hbCBBdXRoZW50aWNhdGlvbiBFbnRlcnByaXNlMRkwFwYDVQQDExBN
aWNoYWVsIFdpbGxpYW1zMSowKAYJKoZIhvcNAQkBFhttaWNoYWVsLndpbGxpYW1zQGdsZXhpYS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnAvrlodpoXdz/u6qumVV3iehHhFFZ
7fxkqPQErluqN6MkJ9U7YT1dM/KtDGYnMXvF8Ld88Q7gc9V3DahWGFbEPvuOK3XF/rlF1uD4qgzA
/m1YZSHFIU5ZCOtKEOeMfyilQGnd/TXsmxlEq0Qj92uf1Kj7e9DamZRetu8GgMt56GADxgg9B+xo
F3iM+oY+BCilXIGO9OHXICqLNSYQIiBdp9U0w07ywssi+d0NFHgP3kF9XTipZg/4zGhSlxj4aogg
zb7gqdNblgL5Eot7WbIW1uKDBCF12RBa0588bZSgLM1bfGZQ4UCXwz+Cb/fEeaNfdVwWfvAM2wOF
M3RYMKbtAgMBAAGjggHUMIIB0DAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNV
HQ4EFgQUULnzVdB1iSXCtDM42c3bQQDz47gwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAw
HQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEB
MCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuG
SWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5k
U2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2Ny
dC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFp
bENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wJgYDVR0RBB8wHYEb
bWljaGFlbC53aWxsaWFtc0BnbGV4aWEuY29tMA0GCSqGSIb3DQEBCwUAA4IBAQBh/q7oj5GUXGr7
/qhiMpC3IwDOPVQsR2lbFsvpu8PaUfKis2IEml373wPfJIStGEekH0/TrIwOHWzvTOthVVcIc0Bo
xM8COhJkiCt7h/IunCQyjzCF35Oigd9l0V4dxAA1MI2jTToKSHyO+1C4tEGVkPTCz1Ft758vs2i6
10JygbmRPs+5LPgl7P12C81bG9KzsBauyBJyM5yq8TcAf9uah4nft0feWqv63NQxFiDGFviCL9Du
KpUkeOrHsYGTny95k7UZFgyiq1RIUmjulf+VHdh69iUD6/9qOI6ZVQI6wslhYoap1tuuUC4Ikvxw
F5uNr+gkmZAuT7XxCKc7yAWbMYICrzCCAqsCAQEwgawwgZYxCzAJBgNVBAYTAkdCMRswGQYDVQQI
ExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDE+MDwGA1UEAxM1U2VjdGlnbyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBT
ZWN1cmUgRW1haWwgQ0ECEQDTQlS64M0x7xehK34If/NCMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqG
SIb3DQEJBDEiBCDeDSKVL1vZL2X64dBiNdo7SE18OJ5n0gC/B7gn6MwqijAYBgkqhkiG9w0BCQMx
CwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yMTAxMDUwMjAxMTVaMGkGCSqGSIb3DQEJDzFc
MFowCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJ
KoZIhvcNAQEKMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAeNUg
m+w/hEL2/am2utVmAXxSZ5g5oaW0YBsqeMaPVwHvYygSFeCGzX9mjOUTYkGnYFgR43fBbpE0JvHX
w6KIR4NN2J1kObSel8f3lkwqS25mXYup03JTFXW1U2D635nRxkImb8xOC0/wgeD4nHOUfG9gjSkG
8YNreqeZBVeot6KQ/D+XPKu4Zj1r8GRrtOWMAiMTUW128jefF6xvXKBLxYNb1vm8NXRz3RzvF7AW
ovYJ9Z3RqLjBCg+AZFKybIjrZ1qcqDS4iZcx1Vzvdgdkb2TXxO7mgalUCuN4NYAmd98IRUxv3Al3
NIlGUuzrvBvi0umfIep3IxM6zmUX4vcHmA==
--000000000000f094c605b81d94bd--
