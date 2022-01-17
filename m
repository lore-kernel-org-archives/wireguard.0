Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F7EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jan 2022 11:21:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4852538b;
	Mon, 17 Jan 2022 11:19:01 +0000 (UTC)
Received: from sonic317-28.consmr.mail.bf2.yahoo.com
 (sonic317-28.consmr.mail.bf2.yahoo.com [74.6.129.83])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f0336133
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jan 2022 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1642418337; bh=Ep7dl6n5k2p4GV4kbAVgowT05w417RGXwSiAHXv3eD8=;
 h=Date:To:References:From:Subject:In-Reply-To:From:Subject:Reply-To;
 b=L+wukxp5b/iO8TKw6+tCmHqwuCxf6XtOuWfB/3pU5zRLj8vDFFpK38n5xhozEX88rjLQ9dt4Dcbq84UdWw9isnpLGAwhEqOUTB+TDFWvNxmU0JCwPwcHvmgHqGVVs/MYX9BwcGfgUc02H5H6yQSP2e/uoUd++82h5+o/BR30zwrge6xr25WG/g06mrQkZkuTt28/k8PBAbygdSQyM5BaNeMJ8wUKBKC26j6+Ju5CaZ+mqcE/X5czizyPVG03z9qdDbFsFyY4lJMA6oPR6r6GCWktHaC4X1CLf8PoTxtrRsI7FnqXOJFRGpXxWqnNP3wUg9T0mGZHEK0Awekh8EyRNA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1642418337; bh=Zu3wcpcReA7MegC2d5XQpx9OPCxMUTli3AJbcWbWggU=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=HsPN86YlgUnjfC5+7ikSyOrs6cg9Rlnrja7fWjjm86cWPom6qsBvuEFlMeed8OdOW/lyUvyG73SRVEARgrT1bBqDxmg0VfJuF5YRa81TsNqBDiPkpAmDPNGMuapWF7JEAjeZ8o8zWJ3nA7KtBNkS5DOxD9rFjrgO49+0qK2yxeArdqJTE4ZJoSBez3p2WMs7W3qn9DfIFV7Mh0HhLSVjn2a83E5Q2oovj8qow8Qb06zNeOkJ0z1lEZiS88fQaXd8gglJK+kpVM8+9uzdAkwP9boUjPAragCn+pMj6CmeZQaD36p8Z8XM+cKvN6ZEW5Nk7iUni075zg5WlZsj0lTWuA==
X-YMail-OSG: xp.UEKwVM1n7F22JZ6EMA_evYBX9qITVcMlXT1ddfnfOL0EV_QOel3XogW_cUqI
 yUVPPm1WhbouAsE5Jh6cert1osWJGgrpOYDQWjv6NktvOcTCXrxHaVVaq4sVZD8pwA.AW3d35GkJ
 HnPupNCwH1XRxtRDSHsMsS6vGBKd5iCSSyrYA23Zvawt9jhxMRUZdhpR1gcDXuuwDtrmJZDNVbFV
 GkKwNEpSgoHVaRD1d24qR.jFv_jxhOPfhSE6fWVxTKV3vLstDyDIG9Tiv54wXKPEPFMtB94e4KVH
 yJdsyAPNIMuUtSP.9BKdtTrhePfm19Fg7_K3FE.za3TOg5sExf2gN1hYHMJTHgkBGlNumUvrtbCN
 hYsDUft3Nv_x.4mns0WrnUa4A0S2hZSIRpT42bvG2o9cOaqbFKFA1XFHwhOYTiaeLy_oth6E82X5
 pA4XxFrf4nxPhiFLAy5bbHxAHabHBdWwZoh1ozmin7jj.nNCeqIXtxk5kYN1mxmMINzUrim362AY
 RKSHyzcegWwaLF3QOj7ft0UilymLWFlHMo7pN2dTgkEOY3qgyO1u7lEA_od1GaKnLQr4qM8Uu2fY
 HILF5NZV0Tw9PRJaL0zai9eAdN8OBmU5InUOnudQ.4yzvPGjEO7HRjdcCbEtBuVAiepIQ8wHJtDf
 HnuQJbAUyiVAhSQE3bvoFajzT0XpJrqJEM7l3qtexWmRors0jyX1o4D6qVPwtJNcFaB0S9wsL7Rb
 HSx.0pydwnEFrfEW3qbGVTlW0focPYeQoDv93V.bxREU_mtPErAC2FgLVXf8P6Cw0Wy48W44o6tt
 B12nZF_JzzKKlsX9TxD8ziZ2N.ph8cDiwr.trKLOtObjaRZsIb6XcGO9P.Cf88eL9xawruEvuXOE
 LUqPJsn7Glhuh7yi8hDTbL2Sha.EvFReH9UyS6lU64s_XMXJohO2k9Mtn7xAH286r5rpvSJi9rrV
 zkmL3LIHaOvyeicSZGAcg4BSPPwDew72FP51HCTofK..o95dykpTK_ubZQwSHDT9KN1dtwDvkJk9
 q5T7DGadMP6fFplPZvT6d_LS9e3d13J50zIIlCeCGnBKYKLF8sceiq55zFO7NobrGX4xvd1i1MLA
 EerciL8dFLF6s5J_DV20PW2pouyp78cAnITeeldif7_4zq7DicqFwy.Ddi3be86wD4uolG1mgrrh
 IzD.WtnvFCaZPDJzS77aUJpuN5.8zTMJ25DIhP7RkNqFsy2kRUNgaraU8yrVuZJ12KdaouuMZAVz
 kfcx0M1S7UQUlC0IPglz.SvrmWej18bdzwps3QELKLVcOfEe.MHI0lzJSdSduk9p9Y3OPCbNtzgd
 woOTanKvZ5AMkVrERo9uy4D1hl1ZCn0svd4vPTxyPquyifx91RX0maZ5EPcsGkBftlhuq0TdcDjH
 d7QKw_Y71IdUsnE3BL5bRGakcKK8DKq.nSez1zyNYduKbO4EY9rp2Smq2S1VU3xcsoDwkNpTvwQn
 apslziPPJeFLhsfBCAtf.5FX2o2JSbl5cUOM5GFFybOu2rdLgtPAAwJAExGZpdOmsqrg721hGgcP
 lnHcBdUgm1SqAjZW4QBlEQyoT_kPHnhE5KiQ9PFarbKUf36cMlkNRp3oy19nV_GHVSVJ8HtxGURf
 r5s43191WE78b7vl1YerQyMWZbaKzg_uTbfFescPBg0KXq0eb5WBWvyLpT822Hjq1Hg.4iN8waom
 vNVNintyNX9ht9veip42wpDYbhwE4PCVAEATplgEGGkSc78NV8MYI9t.bBVfgSdTmLwK_zy2vMt_
 9c.fEup3nlgPrSmPbEQGqDCt9X7UG5Gyk_P55oUp5QLnCr9k6O_1qMdIfNhRXnxsfIr92ZxvptQq
 21c6yT_yJ9Kv9srYK63aCyVvQuM.cF6tfEJW8IaLGt6HJcL9NhmE7vY8xuLSouzq6Usk5rGsTs13
 KuUPIdYzZaIctGLkl5zr8Jkvc9BWmadqBGsK2JFZxb4gpmaguykmLQsly.Tn4vVZXza3heCh5Wow
 gtsDYjgmXvLDag4C.uyWBSMckqNkaNX4OJ8KzeahUkyXfT9V5ELuGEGGZ0GyFKobTwh7cw2pM1L5
 yjCveaxT4StuJlTQx7cfAePN6tVimsvZEFad_6CCXDMcyqEB7QbH4TbCBJ342F77lzdAIvpCObV0
 xuNHZgeKBr.5QHdOTRLUBjIYWtJwQbmWYmDnGo5VLWgJIsgBJ9lETpnW.wp4xXPkHDp_FK1815Jx
 vkYEX3jIQHzD4eUYaKYjj
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.bf2.yahoo.com with HTTP; Mon, 17 Jan 2022 11:18:57 +0000
Received: by kubenode538.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3bdf806edf18a487bf5733fff94d1fc7; 
 Mon, 17 Jan 2022 11:18:57 +0000 (UTC)
Message-ID: <56d2209f-f655-6302-df6d-bce587c8368d@yahoo.com>
Date: Mon, 17 Jan 2022 06:18:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
 <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: Wireguard Windows Service Issues
In-Reply-To: <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------T5W8FH0jMPoSnfWIXXSQO4yT"
X-Mailer: WebService/1.1.19594
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
--------------T5W8FH0jMPoSnfWIXXSQO4yT
Content-Type: multipart/mixed; boundary="------------HXroGVhAOeYKijDzdgmQ0Nxv";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: wireguard@lists.zx2c4.com
Message-ID: <56d2209f-f655-6302-df6d-bce587c8368d@yahoo.com>
Subject: Re: Wireguard Windows Service Issues
References: <M95S0K3OLlWrjbBpofGUvTbVG6o7H8pKclgaVy8bSYAIklVksUf0PfyKeTYWPtt9QUBcrGlmQXnKvvndSWIntkZ-_pWfIG9vGbjeyv7H1jQ=@tpro.tech>
 <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>
In-Reply-To: <e48d98ba2ad34d2f86fb34e5c95aebaf@rozman.si>

--------------HXroGVhAOeYKijDzdgmQ0Nxv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTctSmFuLTIyIDA1OjUxLCBTaW1vbiBSb3ptYW4gd3JvdGU6DQo+IEhpLA0KPg0KPg0K
PiBXaXJlR3VhcmQgc2VydmljZXMgc3RhcnQgZWFybHkgb24gYm9vdCAtIHNvbWV0aW1lcyBl
dmVuIGJlZm9yZSB0aGUgRE5TQ2FjaGUgKEROUyBDbGllbnQpLiBJZiB0aGUgc2VydmljZSBj
YW4ndCByZXNvbHZlIGhvc3RuYW1lcyB1c2VkIGluIHRoZSBjb25maWcgZmlsZSwgaXQgd2ls
bCBzdG9wLiBCdXQgaXQgd2lsbCBsb2cgdGhpcy4gUmVzb2x1dGlvbiB0byB0aGlzIHByb2Js
ZW0gaXM6DQo+IC0gVXNlIElQcyByYXRoZXIgdGhhbiBob3N0bmFtZXMuDQo+IC0gQWRkIGhv
c3RuYW1lcyB5b3UgdXNlIGluIHlvdXIgLmNvbmYgZmlsZSB0byBDOlxXaW5kb3dzXHN5c3Rl
bTMyXGRyaXZlcnNcZXRjXGhvc3RzLg0KPiAtIEFkZCBETlNDYWNoZSBkZXBlbmRlbmN5IHRv
IHRoZSBXaXJlR3VhcmRUdW5uZWwkPHlvdXIgdHVubmVsIG5hbWU+IHNlcnZpY2UuDQo+DQo+
IEkgcGVyc29uYWxseSB3b3VsZCBwaWNrIG9uZSBvZiB0aGUgZmlyc3QgdHdvIG9wdGlvbnMg
YWJvdmUuIERvbid0IGxpa2UgdGhlIGlkZWEgbXkgbGFwdG9wIGlzIGFza2luZyBhIGNvZmZl
ZSBzaG9wJ3MgRE5TIHdoYXQgaXMgbXkgVlBOIGVuZHBvaW50IElQIGFkZHJlc3MuDQo+DQo+
DQogRnJvbSB0aGlzIGRlc2NyaXB0aW9uLCBpdCBzZWVtcyB0aGF0IHRoZXJlJ3Mgcm9vbSBm
b3IgaW1wcm92ZW1lbnQuDQoNCkl0IGRvZXNuJ3Qgc2VlbSByZWFzb25hYmxlIGZvciB0aGUg
V2lyZUd1YXJkIHNlcnZpY2UgdG8gc3RvcC4gTG9nIGFuZCANCnBlcmhhcHMgZGlzcGxheSBh
biBlcnJvciwgc3VyZS7CoCBCdXQgc3RvcHBpbmcgc2VlbXMgaGFyc2gsIGFuZCB3b3VsZCAN
CnByZXZlbnQgb3RoZXIgdHVubmVsIGVuZHBvaW50cyBmcm9tIHdvcmtpbmcgLSBub3QgYSBn
b29kIHVzZXIgZXhwZXJpZW5jZS4NCg0KSXQgd291bGQgc2VlbSBiZXR0ZXIgZm9yIHRoZSBz
ZXJ2aWNlIHRvIHNldCBhIHRpbWVyIGFuZCByZXRyeSBmYWlsdXJlcyANCnBlcmlvZGljYWxs
eSAtIG1hbnkgRE5TIGlzc3VlcyBhcmUgdHJhbnNpZW50Lg0KDQpJdCBhbHNvIHNlZW1zIHRv
IG1lIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIGZvciB0aGUgZGVmYXVsdCB0byBiZSBvcHRp
b24gDQozIC0gbWFrZSBhbGwgdHVubmVscyBkZXBlbmRlbnQgb24gRE5TQ2FjaGUgd2l0aG91
dCByZXF1aXJpbmcgYW55IA0KdXNlci9hZG1pbiBhY3Rpb24uwqAgT25lIGNvdWxkIGNvbmRp
dGlvbiB0aGlzIG9uIGFuIGVuZHBvaW50IGJlaW5nIA0Kc3BlY2lmaWVkIGFzIGEgaG9zdG5h
bWUsIGJ1dCB0aGF0IGRvZXNuJ3Qgc2VlbSB3b3J0aCB0aGUgZWZmb3J0LsKgIFByZXR0eSAN
Cm11Y2ggYW55IHVzZSBvZiBhIHR1bm5lbCBuZWVkcyBuYW1lIHJlc29sdXRpb24uwqAgRXZl
biBpZiB5b3VyIHJlc29sdmVycyANCmFyZSBhdCB0aGUgb3RoZXIgZW5kIG9mIHRoZSB0dW5u
ZWwsIHN0YXJ0aW5nIHRoZSBjbGllbnQgYmVmb3JlIGl0J3MgdXAgDQppcyBoYXJtbGVzcy4N
Cg0KQW55b25lIGNvbmNlcm5lZCBhYm91dCBETlMgc25vb3Bpbmcgb24gbmFtZSByZXNvbHV0
aW9uIG9mIHRoZSBlbmRwb2ludHMgDQpjYW4gYXZvaWQgaXQgYnkgdXNpbmcgZWl0aGVyIG9m
IHRoZSBvdGhlciB0d28gb3B0aW9uczogaGFyZGNvZGVkIElQIGluIA0KdGhlIGNvbmZpZ3Vy
YXRpb24sIG9yIGFuIGVudHJ5IGluICJob3N0cyIuDQoNCiJJdCBqdXN0IHdvcmtzIiBzZWVt
cyBtdWNoIG1vcmUgZGVzaXJhYmxlIHRoYW4gbXlzdGVyeSBzZXJ2aWNlIHN0b3BzLsKgIEEg
DQpVSSBzdGF0dXMgIndhaXRpbmcgZm9yIGhvc3RuYW1lIHJlc29sdXRpb24iIHdvdWxkIGJl
IGlkZWFsLg0KDQoNCg==

--------------HXroGVhAOeYKijDzdgmQ0Nxv--

--------------T5W8FH0jMPoSnfWIXXSQO4yT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmHlUJ8FAwAAAAAACgkQ3PhOoB301mZ+
kBAAlUCTo02mVqEZgIrFKRvsSSEJCpyNVQc64FVUKJ9LvuhEUAuFSl3VdzGn65ogXwUwNjIYRBZR
zAS0jrl5g8MwpnZjyI0f0dMAmJ1lQdFLdtRDL1jkiWtfRtbblcZBfTw4RbUlnozoNNPG57emf2zx
TB1q5aPRg2S99CYwEQA+whZFGIQT6zK5rCPVAMzrWTgVZyP7PhoJP/iHuRnoqK6tVBEbH/R/JBqm
cFVbHc+WiRNDEOW1Fgvmkk972UTPCUsqSSn8sqptX6zXPu00mPh2jl+iZ0iEK7KEaok78mQKpM21
NIccV+HdsYsFrQFaJrqMoKoeNYLShIDnrXRNPxWJigd/9lan3+DQPJpn5XkwTqnZhV2rF7iFpR+a
9vk/BQ98eocLUvW+oXtEqYUp0m2JAjzc2gD0kK/00jLHWiSqIK1EnOvugz5+/AI4EwcySWeIJGTo
7o9qh5/Oy70e86OrW+FWTHI+8Cfw30D+UeYlSWbEu0+PRof8rm0swcrYjDoSgAlP0nV8QnVsTbM1
hbi88QIEqgz69QOhD2/KoIl67wii3ldIbaFY2c9Wc9opRhPkt5k9Fi3C6eQlAXabUeJExSXpeuOC
U2VtpiPRej/WgojMppgIchvIP6W6thOsofdrZ0FC82hvXXYzUDZy5x5ZK0hUn0augqU7/eWLnJBP
69g=
=MnjY
-----END PGP SIGNATURE-----

--------------T5W8FH0jMPoSnfWIXXSQO4yT--
