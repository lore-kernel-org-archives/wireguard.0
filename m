Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7207BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 15:51:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id caf30194;
	Thu, 30 Jun 2022 15:51:07 +0000 (UTC)
Received: from sonic316-20.consmr.mail.ne1.yahoo.com
 (sonic316-20.consmr.mail.ne1.yahoo.com [66.163.187.146])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a11a0347
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656604263; bh=Y6ryHSE0StZhDvaa9YCLOEwpCXkBYaLq5B0VJaijUbA=;
 h=Date:From:Subject:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=Zc/7OmFe0Vt8EwsVy1OJ/b57zJdI87+grsgmk/PbROb64jSri+IFPhUQSIi+kLpy+G9nRM9IYIVMxJ3BrHqUK2JkFhemkgzaRrO3/qAIZGfA/y41LHCnS5JBfWMYgjFEePYj+ls4lHXrw0NutGprbWYQGf/Y5J6ElX61XMnTyHc0IfApr9JQjUYao5BsYTXw8vw9EkqOdN+S1QEhw6bq9TbmP+wN11aFowIF77PXdaaWe7exnzXjkAlImFektH5D+L/UaU8WqE8hQBknat8UxqWcKEjOVjKwTHlJ74VhSztl6hSLhXahORZWMFsggk0HrPzzy6DbpSvTHlyDlaMEoA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656604263; bh=WWixyFmTZPMiAVsC7+zwuAitQLuHGGdJpbYr6HI5R/p=;
 h=X-Sonic-MF:Date:From:Subject:From:Subject;
 b=gbG2tun5KxHdw8eUwCVbF8cx5lCCk5p6me4iUwTbatlL+6GJvuzUXjv/opmafV8BIRQeTF/rkS83wMH1yddbLI6dWFAxuQNUa2BXiY4esyIcKtzegneLi4Xv+J8AWOEfIZhQCKAFxsstO64WCdjtq2W5LeQw0dmrSb1eT94HmqxyKGsByiQ7VXR5c65vBEnjk38k4jv7fjDlNIad5sSqfuWXPdMH9hPLe7ENf2I+SuNQpCBbzYtvsbzme475lvHgTqLx59HCBM5CMSGI2jPYMDfn13syoNBQ0cVhcSY2/lAPHdUjM0iLpu/GkewaMH9irQiKvdEsYke/AzT+jFoY8w==
X-YMail-OSG: CY.0CQ0VM1mqV6Bxu1LLYkUcsiOjsng1aSE3W4yoFqWG4dUaPby5327KUkt8k25
 oHV84tUyYCvxDeT6Gg8APN.frq_HfhvkKIdZ1xUITx5MKrncU8osX5CVecYLGSUJdFR4SWNb2x0K
 1EXDLzmy7I90d.kspahuPEIhx0eRcF4WyBSPeudxg_ArIyfolxy0JIIZiyjEETEGRGgiZM8JFqRi
 ud.tQJsjsjXiEwyoRtVPaQfJtcwv65pUQJKF3F2wp0RJyJBvHGaBAOCMZs3BSOtgFAFtAP1JprGf
 uxknYh3G8b0Ye5Q1GUc5ocinz9l5_M6IgzN2Ali_gbtXjaVZPoERfjP6XgUtYVBm.5U9UxkzGs19
 hLRI68IF.UfB_G70IIVlamSq7ec2kk50upr8Bw.OydsVsdOoywtM66nPHpmWxdXZanlGZHKjhuSV
 oe2Ux114lWM1fGDEoy.4vYSvTfXNUeOLFlNdr.Cem_Emoa_73hoeEHV_Yn2Jhk1ouDqIF6nAnNuX
 FtzqZfNyBiq5BpFo_r.7O0Ry3sWq_KBoZwnV8KMSI9FUpxXiJ._1Ar7Cr3MsJTDJYO.NZLpgssXo
 h9kz_7PuP0DeTCRBcdv2mAlURFMFhEs78feQy1X1UFLGSgKLBsACI7Le9BTwRo.gIhcAWTSlQV8k
 1FdVgYHQ9SFbbtGfT_fEosNoJO8ohA3E6Czf_gIn9HoYz787MvmIPEN38g7CGO1CkgsSSW1ODZ_3
 6EfT14r.oTRMdq.mQHnpkDJZJb4jWXSPpeMBiCgbvwZhKVILmWsHNNrJ4dEWL1sb2SW0krwB.VhY
 fur0INvgbpM_0UC1FSXaWZwVi17bzujox4DcTtrPqhNi2YvY9V6tQDFtNXY9F6htZ6wAM20VZbI2
 sVK2.easr9GJrFq06ZDK78_s1czCjxi82v62WjPt.FiK0ze8dyUDJFbI7cIsEUUeJPZ03uBN5wVi
 laFvt8_kyxgnFHoTDJYQBIcUV2cF8kZFshVLocipqnWRaeaf4_4rbvxad4X7YJizutzXGJ4C_Xka
 FT12QxhoS8kjl2rjdpxquEgC8hJhRjm0Uot3BvbnGdgJ3S.df_OMuwWvOsQ8Z3St1cjG_So8Q4SZ
 k_coJpYpOTgowOpyxi348Y0Wqtad7n37Ix4Z.Bc6_6ar9k4Qw4tXjE5EE64FWvTdbxeL_QQYHRL5
 54W_XjSlK5ej_k4SU6Tgz26yJ_unE.tdpmNzR5j.urB6X7Bqz1xw0pzEk4XMrYaC1SaYFAmJbugq
 RB.TxhU2tOKifHSUHn3YUGvX7_GnbL5uDxNihk_92iZ6ce_5V_yJ9WQ7a8zQ50.rQ_qEaCW2kRmb
 bq2mugHay4qjex1nVMTk9Oph6Zk00ip3mcoWcjpWq8IM.ErQSeA8g38E0EsuRu94R5A4OzjAdAlw
 nzxjOr.lWhfroOdTl3n93O_hy5yD7UCNZ41js1D.uEBXpXvdbtu3anTQIzc990UU5Dv0H6d1_Nlb
 JifG31t5E59DCXYfzDWdvMjmSkGU2NWavTwH8coDfSPD1iDME_ZyDwGKYLXZ4XxKdcy5mVh4iIj1
 r_V1Uh8IjwLo38Eq_WW8dHnKZFqY2.Jh78Fm2J2JgdrAekH3utG9pesCmRL5Xi2zCQGoOfcfAV7q
 .DWQ4D7tK1Y6AGGHgt0b88kjizvrvTssRXHetEDFtRkoaoquLU0GYjxICXiEtKmK2UF9YvQJGYpI
 Cyd.7J.eitbdPOOzXk9fdL8PkJX3sfqXkUqA7LS.kO96EvR81dO7UX5TxjEWuO8uaAkMYEq0PZW2
 Eme5IgdPnWLcFBGJhwoECbl2Hnr_9GUMeVBHFxpoNBK1LGfQPoQc2vfPXEeUPW76O1fOMd7ApGSH
 DQt6hxpGArBWuvmLyo7Is3q.JpOkOjlOhWX6V.ODizQY_Yo1UhWbujgR3dgRIZ7LZbcaKX4kvl3B
 o5KlqIYbNQSEb0SD4T7UmbPSZUqr9Ul5QF0ExJX4879VTVb96OjEgkJ80wkyITpZEDdYRnewOQu_
 E_CY5Y4j2P0zJRxQI6mLigpql6KVlf.R6caYfZn8JK_DT_TU1MVKnJIYXsccJ_OJj4WnfcjuwDOm
 EX.AGxqthA1KECcmvOCL6vAetRdPGFkb0JqP6bcKfz1cqH_MVTTm5WP.pRbiAz1QdklBiFtZx911
 KHWcvBN740CMf4STFwfCpkfvlev1.i9IkX9W8ipcgijDA6EtfYh8vpz_ZCWNWxrhN1wndQ1bMdfd
 2vpYF8757h0PYVTTbIP4aC48P1ALKhhzLH0mLC59VSMEODac-
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.ne1.yahoo.com with HTTP; Thu, 30 Jun 2022 15:51:03 +0000
Received: by hermes--production-gq1-56bb98dbc7-gzlsn (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3b749686c1d1f5225617e04ccc8a030a; 
 Thu, 30 Jun 2022 15:51:02 +0000 (UTC)
Message-ID: <dd586079-c81b-4715-e818-4cf7f0ddf4d8@yahoo.com>
Date: Thu, 30 Jun 2022 11:50:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: CONFIG_ANDROID
Cc: WireGuard Mailing list <wireguard@lists.zx2c4.com>
References: <23929467-11c2-cdf2-3841-2a837ba58b51.ref@yahoo.com>
 <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com> <Yr2L9759Ek63KV1F@zx2c4.com>
Content-Language: en-US
In-Reply-To: <Yr2L9759Ek63KV1F@zx2c4.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tlra8mh0Ny0GNonhrQj0kqbe"
X-Mailer: WebService/1.1.20381
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tlra8mh0Ny0GNonhrQj0kqbe
Content-Type: multipart/mixed; boundary="------------tQzmJk6dENTF3bqAFQDm0Fo6";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
Cc: WireGuard Mailing list <wireguard@lists.zx2c4.com>
Message-ID: <dd586079-c81b-4715-e818-4cf7f0ddf4d8@yahoo.com>
Subject: Re: CONFIG_ANDROID
References: <23929467-11c2-cdf2-3841-2a837ba58b51.ref@yahoo.com>
 <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com> <Yr2L9759Ek63KV1F@zx2c4.com>
In-Reply-To: <Yr2L9759Ek63KV1F@zx2c4.com>

--------------tQzmJk6dENTF3bqAFQDm0Fo6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAtSnVuLTIyIDA3OjQxLCBKYXNvbiBBLiBEb25lbmZlbGQgd3JvdGU6DQo+IE9uIFRo
dSwgSnVuIDMwLCAyMDIyIGF0IDA2OjQ3OjM4QU0gLTA0MDAsIHRsaGFja3F1ZSB3cm90ZToN
Cj4+IEZXSVc6IEhhdmluZyB3YXRjaGVkIHRoZSBkaXNjdXNzaW9uIGFib3V0IENPTkZJR19B
TkRST0lELCBpdCBvY2N1cnMgdG8NCj4+IG1lIHRoYXQgdGhlcmUncyBhbiBhbHRlcm5hdGl2
ZSBmb3IgV2lyZUd1YXJkIHRoYXQgc2lkZXN0ZXBzIHRoZSBpc3N1ZS4NCj4+DQo+PiAgIEZy
b20gdGhlIGxhc3QgcGF0Y2hlc2V0LCBpdCBzZWVtcyB0aGF0IHRoZSBvbmx5IHVzZSBpbiBX
aXJlR3VhcmQgaXMgdG8NCj4+IGF2b2lkIGNsZWFyaW5nIGtleXMgb24gZXZlcnkgd2FrZS11
cC4NCj4gTm8sIGl0IGNsZWFycyBrZXlzIGJlZm9yZSBzbGVlcGluZy4NCj4NCj4+IFNvOiBX
aHkgbm90IHRpbWVzdGFtcCBrZXktY2xlYXIgZXZlbnRzLCBhbmQgZXN0YWJsaXNoIGEgbWlu
aW11bSBpbnRlcnZhbD8NCj4gQmVjYXVzZSB3ZSBkb24ndCBrbm93IHdoZW4gd2UncmUgZ29p
bmcgdG8gd2FrZSB1cCBhZ2FpbiwgYW5kIHRoZQ0KPiBvYmplY3RpdmUgaXMgdG8gbWFpbnRh
aW4gZm9yd2FyZCBzZWNyZWN5Lg0KPg0KPiBKYXNvbg0KDQpUaGFua3MgZm9yIHRoZSBleHBs
YW5hdGlvbi7CoCBPbmUgbW9yZSBhdHRlbXB0Lg0KDQpJZiBJIHVuZGVyc3RhbmQgd2hhdCdz
IGhhcHBlbmluZzoNCg0KWW91J3JlIHJlYWxseSB0cnlpbmcgdG8gZXN0YWJsaXNoIGEgbWF4
aW11bSBrZXkgbGlmZXRpbWUgLSBzbGVlcCBiZWluZyBhIA0KcHJveHkgZm9yICJ0b28gbG9u
ZyB0byBrZWVwIHVzaW5nIi7CoCBPbiBjb252ZW50aW9uYWwgcGxhdGZvcm1zLCB0aGF0J3Mg
DQpiZWVuIGdvb2QgZW5vdWdoLsKgIE9uIHRoZXNlIEFuZHJvaWQgcGxhdGZvcm1zLCBpdCdz
IG5vdC4NCg0KWW91J3JlIGNsZWFyaW5nIHRoZSBrZXkgYmVmb3JlIHNsZWVwaW5nIHNvIHRo
YXQgYWZ0ZXIgYSBwcmVzdW1hYmx5IA0KbG9uZ2lzaCB0aW1lLCB5b3UnbGwgbmVnb3RpYXRl
IGEgbmV3IG9uZS7CoCBCdXQgb24gc29tZSBwbGF0Zm9ybXMsIHRoZSANCnNsZWVwcyBhcmUg
c28gZnJlcXVlbnQgdGhhdCAibG9uZ2lzaCIgaXMgaW5jb252ZW5pZW50bHkgc2hvcnQuwqAg
QW5kIHRoZSANCnJlbmVnb3RpYXRpb25zIGFyZSBleHBlbnNpdmUuwqAgT24gdGhvc2UgcGxh
dGZvcm1zLCB5b3UgZG9uJ3QgY2xlYXIgdGhlIA0Ka2V5IHRvIGF2b2lkIHRoZSBmcmVxdWVu
dCByZW5lZ290aWF0aW9ucy7CoCBUaGlzIGtlZXBzIHRoZSBvbGQga2V5IGluIHVzZSANCmFj
cm9zcyB0aGUgc2xlZXBzLg0KDQpBbHRlcm5hdGl2ZWx5LCB3aHkgbm90IG1ha2UgdGhlIG1h
eGltdW0ga2V5IGxpZmV0aW1lIGV4cGxpY2l0LsKgIEUuZy4gT24gDQphbGwgcGxhdGZvcm1z
IHlvdSBjb3VsZCBzZXQgYSByZW5lZ290aWF0ZSB0aW1lIHdoZW4gYSBrZXkgaXMgDQplc3Rh
Ymxpc2hlZCwgYW5kIGlmIGl0IGhhcyBleHBpcmVkIG9uIHdha2UgKG9yIG9uIHVzZSkgdHJp
Z2dlciANCnJlbmVnb3RpYXRpb24uwqAgVGhpcyBndWFyYW50ZWVzIGEgbWF4aW11bSBrZXkg
bGlmZXRpbWUsIGluZGVwZW5kZW50IG9mIA0KdGhlIGZyZXF1ZW5jeSBvciBkdXJhdGlvbiBv
ZiBzbGVlcHMuwqAgQW5kIHlvdSBkb24ndCBuZWVkIHRvIGtub3cgd2hlbiANCnlvdSdsbCB3
YWtlLg0KDQpJZiB5b3UgYWxzbyB3YW50IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBrZXkgaXNu
J3QgaW4gbWVtb3J5IGxvbmdlciB0aGFuIA0KdGhhdCB0aW1lIChlLmcuIHRvIGF2b2lkIGNh
cHR1cmUgb24gYSBkdW1wIG9yIGRldmljZSBsb3NzKSwgeW91IGNvdWxkIA0KYWxzbyBzZXQg
YSB0aW1lciAob2YgdGhlIHNvcnQgdGhhdCB3YWtlcyB0aGUgQ1BVIGZyb20gc2xlZXApIHRo
YXQgY2xlYXJzIA0KdGhlIGtleSBhdCB0aGF0IHRpbWUuDQoNClRoZXJlIGFyZSBvYnZpb3Vz
IG9wdGltaXphdGlvbnMgaWYgbmVjZXNzYXJ5Lg0KDQpUaGUgcG9pbnQgSSdtIHRyeWluZyB0
byBtYWtlIGlzIHRoYXQgcmF0aGVyIHRoYW4gdGhpbmtpbmcgYWJvdXQgdGhlIA0KYW5ub3lp
bmcgcGxhdGZvcm0gYmVoYXZpb3IncyBlZmZlY3Qgb24gdGhlIGltcGxlbWVudGF0aW9uLCBp
dCdzIHByb2JhYmx5IA0KYmV0dGVyIHRvIHRoaW5rIGFib3V0IHdoYXQgV2lyZUd1YXJkIGlz
IHJlYWxseSB0cnlpbmcgdG8gZG8gYW5kIGV4cHJlc3MgDQppdCBpbiB0aGUgaW1wbGVtZW50
YXRpb24uDQoNCkkgaG9wZSB0aGlzIHBlcnNwZWN0aXZlIGhlbHBzLsKgIEknbGwgc3RlcCBv
dXQgb2YgeW91ciB3YXkgbm93Lg0KDQoNCg==

--------------tQzmJk6dENTF3bqAFQDm0Fo6--

--------------tlra8mh0Ny0GNonhrQj0kqbe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmK9xmMFAwAAAAAACgkQ3PhOoB301mYn
TQ/9EAwlKG4znseJoSpyt5J9fmKn0VkyXUZmeIoDiadBlZLm6vuSWSz8FpKm//rlJDLcaBqz2Ial
UIWoW1ZSVvnhNyUIbHdUNzRIhF49s21JD1IhHjbb9WreTQGXt3DFPVoFNlC53eFcQPE+EslfD70o
PFKKUh6LvNvbzyBCSK3d8Ny7CxKg9FK2GvvzRXQ9jA7og8lgwbYfkHfot3wmoTnyZDB/0ULfJTQK
lmiVbUx8XvmrGxLOc2vO5WJ9crUlXot2mwtY+6jLAwCc8d88wawLKF8Kz8pJfElcF4xZHsTDdVKi
mm8cMliddpZEKGeKh3AGsJ0Acer+T6rILa8bkxDp/11l4HCVtVXJOtJe7Gw0JXVs648uUEga620y
GDU8aMjZ1wN8ehDBI5vjDcdPiA2DLNKO6h78Slowzd+GmoIUK7opHu3sSgiKKAVEy1rd1DrXl0xI
WknVwhOzK1HBlD0nWRgzUj+CSrpXVFcJ5ypbIrON8nNpx/C5cKbU1Ptgid4rGGvARkfWHjuXeRp3
Xt1iGb/Bp+LivZbn3vtBHypVhMTyAN0z4689o2eeaF1p7lu4pVsBkYAizGnmf84scAB7doIyvyb/
H+Apy6pH9Ez6XMmyjSIbRTLGqtU1G6CaX06ldgxKVAJVhBqAyY1nkjLfjZWpsvOAqpbv3gxfBq1G
WvU=
=iRKV
-----END PGP SIGNATURE-----

--------------tlra8mh0Ny0GNonhrQj0kqbe--
