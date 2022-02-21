Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE7DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Feb 2022 18:52:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b029479a;
	Mon, 21 Feb 2022 18:52:17 +0000 (UTC)
Received: from sonic309-21.consmr.mail.ne1.yahoo.com
 (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 61ac0a70
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Feb 2022 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1645469533; bh=oTJxwtUrB8LBrEgRZoA6lJQvm887HVc9aC71hkhpGKQ=;
 h=Date:To:References:From:Subject:In-Reply-To:From:Subject:Reply-To;
 b=INjLrnQsYyd2vygGSdDp8os+0EOFD5DZvA/c1laKQz50y2CQD2iGVxUDBFMq7nAkgL+QFcwWJOZTrG5rBf4qTvhFMYdthg9OYeqjSg2S1vtkRiEi862Zj/x3rplsK6Gn02DApkcX8nBOoKTmyvKsBJddttydkXKPSFPjHEdH9w6EcyvoBV1t/qCZ3sXZqjtmt392z6Gd4EoU5SwlFS55IyJ/H4V64qwfPUZarrnABkDc63QI6PgE128WNoIFArdj1wKGcCBqT0zBq9TrpBPQL0neDbwTy9Z7JzCsxLUQrkBNJwMD1Zq0ooM7MzYTpX31WEVJ49ZOy5UHvvQq47NxOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1645469533; bh=zfwvxKpOokzq7sqe1QZHyNAsyRkTuuOEAx8CcgHmGaK=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=hlF7d8yJL6jzoujlClqGJuqyhPCTpLl5++LkuJoRdLp9Z69QVwq6ZCcMJzaVPCynglI4j4L3J/uIrhWupiGE9rb3TU3dtidiJkxzrzUKZntsEy0lBtHuMdLTreefwkculUtitSxR4TwDzfks6TOZqgLGsJotZYy8uO04+xYEgsfrNmSDuKCs1Jz8gk7NAaLrNbqb1SlPcXp5V0V1vYU+6X6ZKo79gqqIMusWvG5biS4OECGH4XRUBCOrliEzekIne2uMCTcFom6R7lhO9aQOrsxv8h4vIN26z9rx1sc0++hIQeQkcUxZTluSkJ+faGO6/mXZqcRpPto3UVTcHmBLlw==
X-YMail-OSG: 42f.TIgVM1lE_CaSIqk8.e8RtNF0IkP6G4D1tYq5wckSCdls8aLOECCOfIiXSAF
 ONL3J60QJNDywIQ5t5flHAnunIlDXt4XU0rFvdAPhJGRgunxQwOqkq8A5obK8nGWyTG.rXpGoVfp
 _Z0Ct5ZBr8OYYJDsA9bhJAmYff6j50qX_d6btYi_KRf2tZ4gwAz4SZgaug.5neDyQGc.IOUm7Wlp
 PJ8drD4qXXKWn.hRk11DoTNYNYR61jWmLyID2AwzjAnx0WT8Y1Udu0aTGmg20OFS1CrqnDySENM3
 _W1ltZSuDTelDeJhW0Rt1xMrybE9HxKiseJxK_LdnLoA4bQV_Db0bx71N1XBn54VxpejvAAPnSZI
 38pWz9vN2cxoUX5hcdeuAzNovjTWcaV7E6Dgcjci_MQIeglFuczeHSaPXv9ECjnWtzjOoTJrXdC5
 pxFnu.Lp7hj6hmLZFAWPzMA3rL.z9j9i7LVd6WxSR2Js0CCVQumYDBy65dwfy8aBAmQ0hY4pvPCp
 l0WIqhQSZkDfNCO0fmoTxj2lc_o9jVhTpLEXz42H4.kds1RAKW4lFfoJi8bXlbXUyl2QAik.5WVH
 n22ObtZVdV.XhBJehSR.rzY2mtDumzpbpz55dYOwDB3Yyl6rOZBl8boCTSp9vhjhl8c_e3O8Ph3N
 zgcBn1a9u9y6ORj7SrccuyUcl7i7gxhTjAGH72JdJxkR9oUCX4JuD43R2Pt51Yx_2ZHcfSdzCeWf
 F2_EphymFM9TdpvA7A326pYqWPZKKvSjwBvoMTFyZxLv7m1j8LDiGo0qNZm7ySxps3K4nc0JQaXd
 RBWbUjfAmbAosUsdGygkNiH5TY5sZRgyUtLr58UXbxDPtEB6PaGXUDIOe.Q5lDFRWkz1HB3qzvjH
 sqkDTJSCFdnFmol4ecSHrlEtbxQ9LEBy1A7lPeKJeWOll7mcywPFKJZnnYge8xN7wosP0nW9JwTP
 hM_cRO_0jRgp0ZCYTfMs2k2ucd3cR_ZJ_5hUymHJJFwdzUYIwA8.dd389uushWQcRoNXiwY3F8T5
 QK8LHXTwfoy9nDyOKNVynqfuVipUYVgz0Gx3gbdOyO.SvIp6m_ztkbQaMIY9jq6Zt0VZ8jGMRzkh
 CpamAPI8KzHazThQNiMlm.yR0xHFAcPm1Gf0yoEGOjIF0meQY7Uw1uzf1_eW.KCFglQ3nkinrrYo
 XbvyMQ.D2rk0SAMJNXZfR5sApzVsOPQtLVvtimGuKJAptm5hyIys_pJzCz596K_ZaYK9KuNYLdB3
 TXRgjhRTgDI4fhf_8E4vLzunpLiv_bYTxorhhiTAHT9i3enmHyqm2Psh_7WgG94gSuQrUUYpsY_J
 JtKAXvJdaiQnukFmx_ObCJjW.oNS3pYC_3t8Qg3rqKAB6uPpmsD5tGx0ZopTKga3bwKHVTW6zm4o
 23RRJqRsWCArPc7GVB_qB4v_Gr7xFzGrtkclO8q5pRGpahtImWX1MptlSgBaB1gNSehQqYebdItb
 VwnVXsivh4Bt1_0VN_c2nSs_ROxxG5q9QJ3k2vqyoeY_eHxIZlnvvO4KOG2cukxxX7wiW6cI7YtH
 tEuSQ1A3_yY1zLlnYlTYG5p5pggFa4Nwt9SI4cikitU4OmFkJcdCV8uai1PHeUZ.U9d3OP5IZonX
 MICKGge8m1zuHa3pxs4xVhduBzXhmMTPhBDVetAKOjhxyDH11k6baDw.HRzX3XPlEgEojEdZyt7M
 bboD5hAN.NCzHlz0d5Gbsg.5rdGtr4dWvH7OPoCY0XssrSTdPxpaTzJ4p.Q3WywclXHLjEicRlyL
 YV6K4iKRmHzbVXz1A4GpvDQXSI1hBugAw2zdqL0T666x8MsNr9GK_GIoFV9NGBIRHzLzqO538kbR
 MBdMEa11RfGs6ystE3wUhfSJAOzEXkGKaHW7TZiXiHpjiQ8dm4PzsUllpUZsBPCPkp1I7anIUC3H
 LyVKu1OKEiMl7K2WqhThi4zx5_Tv0o2tGQvYoChmYE.Rq0ikhWwjfwmmdZVNwRkx5nqktr56rh6W
 hUdg.gmurLvUhZfcMfnkG7GjiSTJkgz0.UC_K9YXEhpJE6Gvd.Ysk1xTmpN1V2BX5VUpisnnQJgk
 G68CV6AOLr32Qs5k0xcgNhDY8YdLpzYnfNQDzSyasqoPalTkjO39SHTPwPp_pn.bTC_0NZcD9Ik5
 Bpn4m7AsOc6.7fAGznT6fmZB00NVPCmUNPndQ9RcmP0oXjxPwCan9uSez_bd7TmSCAQXtLp3ekrd
 2vw8cXfOEKhhejwpysdzZwEaKJhos_4T3S42p1g--
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 21 Feb 2022 18:52:13 +0000
Received: by kubenode551.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3cc0d4877570b9530bcbfe17a6ab7cdc; 
 Mon, 21 Feb 2022 18:52:08 +0000 (UTC)
Message-ID: <3fea080f-9d01-6471-31e2-e14e39c02575@yahoo.com>
Date: Mon, 21 Feb 2022 13:52:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: wireguard@lists.zx2c4.com
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: WireGuard Windows should have default MTU of 1280.
In-Reply-To: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S16v3cYvbcJyAPr9uTIqy40S"
X-Mailer: WebService/1.1.19797
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
--------------S16v3cYvbcJyAPr9uTIqy40S
Content-Type: multipart/mixed; boundary="------------QYioa0daUmz4LZ40R2OR4P5f";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: wireguard@lists.zx2c4.com
Message-ID: <3fea080f-9d01-6471-31e2-e14e39c02575@yahoo.com>
Subject: Re: WireGuard Windows should have default MTU of 1280.
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
In-Reply-To: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>

--------------QYioa0daUmz4LZ40R2OR4P5f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTgtRmViLTIyIDIwOjIzLCBSdWpiaW4gd3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBpIGFt
IGp1c3QgY29uZnVzZWQuIFdoZW4gaSB1c2UgZGVmYXVsdCBNVFUgdGhlIFBlcmZvcm1hbmNl
IG9uIFdpbmRvd3MgaXMgVkVSWSBwb29yLiBJdCBpcyBhbG1vc3QgdW51c2VhYmxlLiBJdCBo
YXBwZW5zIG9uIG11bHRpcGxlIFdpbmRvd3MgZGV2aWNlcy4gSSBzdGFydGVkIHVzaW5nIE1U
VSAxMjgwIGZvciBhIHdoaWxlLCBidXQgd2h5IGlzIGl0IG9ubHkgV2luZG93cyB3aXRoIHRo
YXQgaXNzdWU/IEZpcnN0LCB0aGUgc3BlZWQgaXMgbGltaXRlZCB0byAxMDBtYnBzIG1heGlt
dW0uIFRoYXRzIHdlaXJkLCB3aGVuIGkgdXNlIE1UVSAxMjgwIGkgaGF2ZSAxZ2Jwcy4gaHR0
cHM6Ly9pLmltZ3VyLmNvbS9FTEdPV0RRLnBuZw0KPg0KPiBUaGlzIGJ1ZyBleGlzdHMgZm9y
IGEgbG9uZyB0aW1lIHRvIG1lLiBJIHJhbiBXaXJlZ3VhcmQgb24gYWxtb3N0IGV2ZXJ5IHBy
b3ZpZGVyLCAoaSBkaWRudCBjaGVjayBpZiBpdCBoYXBwZW5zIG9uIEF6dXJlKSBidXQgdGhp
cyBidWcgZXhpc3RzIG9uIEhldHpuZXIsIERpZ2l0YWxPY2VhbiwgT1ZILiBUaGlzIGlzIG5v
dCBub3JtYWwuIEkgYW0gcnVubmluZyB0aGUgbGF0ZXN0IHN0YWJsZSB2ZXJzaW9uIG9mIFdp
cmVndWFyZCBXaW5kb3dzLiBLZXJuZWwgbW9kdWxlIG9uIHNlcnZlcnMgYW5kIEJvcmluZ1R1
bi4NCg0KVGhlIHF1ZXN0aW9uIGlzIHNvIHZhZ3VlIHRoYXQgeW91J3JlIG5vdCBnb2luZyB0
byBnZXQgdW5jb25mdXNlZCB3aXRob3V0IA0KZG9pbmcgbW9yZSB3b3JrLg0KDQpTb3VuZHMg
bGlrZSBhIGZyYWdtZW50YXRpb24gaXNzdWUuwqAgV2hlcmUgY2FuJ3QgYmUgZGV0ZXJtaW5l
ZCBmcm9tIHRoZSANCmluZm9ybWF0aW9uIGdpdmVuLsKgIEJ1dCBpZiBwYXRoIE1UVSBkaXNj
b3ZlcnkgaXMgZGlzYWJsZWQvYnJva2VuLCB0aGF0IA0Ka2luZCBvZiBzbG93ZG93biBpc24n
dCBzdXJwcmlzaW5nLg0KDQoxMjgwIGlzIHRoZSBtaW5pbXVtIE1UVSBmb3IgSVB2Ni7CoCAo
UGF0aCBkaXNjb3ZlcnkgaXMgZW5jb3VyYWdlZCB0byB1c2UgDQpsYXJnZXIgaWYgcG9zc2li
bGUuKcKgIFNlZSBSRkMyNDYwIHNlY3Rpb24gNS4NCg0KV2hlcmUgYXJlIHlvdSBzZXR0aW5n
IHRoZSBNVFU/wqAgT24gdGhlIHBoeXNpY2FsIElGLCBvciB0aGUgV2lyZUd1YXJkIElGPw0K
DQpJZiB0aGUgZm9ybWVyLCB5b3Ugd2FudCB0byBpbmNyZWFzZSBieSB0aGUgc2l6ZSBvZiB0
aGUgV0cgb3ZlcmhlYWQuDQoNCklmIHlvdXIgcGh5c2ljYWwgSUYgaXMgSVB2NCwgYnV0IHlv
dSdyZSB0dW5uZWxpbmcgSVB2NiBvdmVyIFdHIC0gdGhlIA0KbWluaW11bSBNVFUgZm9yIElQ
djQgaXMgNTEyLCBzbyB1bmxlc3Mgc29tZSBNVFUgaXMgc2V0IChhbmQgYXZhaWxhYmxlIA0K
Zm9yIHRoZSBjb21wbGV0ZSByb3V0ZSksIFdHIHBhY2tldHMgd2lsbCBkZWZpbml0ZWx5IGZy
YWdtZW50Lg0KDQpJbiBzaG9ydCwgeW91IG5lZWQgdG8gcHJvdmlkZSBtb3JlIGluZm9ybWF0
aW9uIChpbmNsdWRpbmcgYSBjb21wbGV0ZSANCmNvbmZpZ3VyYXRpb24sIHRyYWNlcm91dGVz
IHdpdGggcGFja2V0IHNpemVzLCBzZWUgaWYgTVRVIGRpc2NvdmVyeSBpcyANCmJsb2NrZWQs
IC4uLiksIGFuZCBkbyBtb3JlIHdvcmsgaW4gb3JkZXIgdG8gZ2V0IGEgdXNlZnVsIGFuc3dl
ci4NCg0KVGhpcyBpbmNsdWRlcyB0aGUgV2luZG93cyBxdWVzdGlvbi7CoCBJcyBXRyBydW5u
aW5nIG9uIHdpbmRvd3MsIG9yIG9uIA0Kc29tZSByb3V0ZXI/wqAgSVB2ND/CoCBIb3cgZG9l
cyB0aGlzIGRpZmZlciBmcm9tIHRoZSBvdGhlciBkZXZpY2VzP8KgIFdoYXQgDQphcmUgdGhl
eSAoSU9TLCBBbmRyb2lkLCBMaW51eCwgVk1TLCBaT1MsIC4uLik/DQoNCg0K

--------------QYioa0daUmz4LZ40R2OR4P5f--

--------------S16v3cYvbcJyAPr9uTIqy40S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmIT31UFAwAAAAAACgkQ3PhOoB301mYu
LxAAqiovADkkzxQ/EpapbNsuHt4UzAbCnKaTOis9C92VfjZ+CY5mDj4BpaIJnIdj49ImmM24+Xwz
YbBoUJ4pAZXjxFiHX8exOnCDE6JES/MMRrnkHeD4kquiDtzTNno3WsWOVJaIlMhe16XezCqBXyVY
TXinaxp1nlYR19+pfdv/UZVtlYrFJ1F3Wju38Oh+DfV7QrSSaZvTTNuHT4AVL2ub3Gg4bU99g+Ve
NYDbeSI4zt6StgdQDK2GwXuZy3ITXuP8+JzXMpsofWZeRTUPKF1YsvBQxvgeX3gmJA/4ning0imi
53zxorG1HNjQ/Y/zW3AF58dQlrX7e6/Cn+BJhe0oFpVsKiqPEKkqZs6VSd436V7aBEXdddKDb2OY
RfvARGNXGH+8cGKSpLawgXLt5fNJ9zelOUh/mznIxmD3UmOAPe+fMCZxhLssr69zWQhEWLOgckAo
t11PAshwHs5LTGuUQMzlWOcYO1S0jEiJ+eKL+I2zE3uvOGoLjnmZ77NaCal2h8NKDADpo8SNu843
SyVeMzwJTDewwYf4wF2nBcXTjTstJkpvnof1VHBU6F3nhutPzMc12idq6yCLz4R31GtXO4FRh4JD
1+1zFYKqBUvStA67BPkXejZaNLgIpKB4Aktid+FgrmflmIoNMwobv3HbyjpcjJXjISQQ/YFUx4x4
Aik=
=UXjP
-----END PGP SIGNATURE-----

--------------S16v3cYvbcJyAPr9uTIqy40S--
