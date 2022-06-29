Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD44C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jun 2022 16:30:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0398c78a;
	Wed, 29 Jun 2022 16:29:10 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c721396f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jun 2022 16:29:08 +0000 (UTC)
Received: from [192.168.68.152] ([141.136.189.73]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M5PRT-1o5l571VIr-001PfB for <wireguard@lists.zx2c4.com>; Wed, 29 Jun 2022
 18:29:08 +0200
Date: Wed, 29 Jun 2022 16:29:10 +0000
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Wireguard-android: consider displaying last handshake ?
To: wireguard@lists.zx2c4.com
From: Max Schulze <max.schulze@online.de>
Message-ID: <75C09BF0-72BB-46C6-90CC-61683021617A@online.de>
X-Provags-ID: V03:K1:1keWP9Owgk9T2MIyGc4VBZe1Fn3qjEMoJatjuy43tqgzthz4ebY
 UywBjJj9ElVty4mQ+CHb5MFDbcU30WBugMksWwjoShSznebjxRlpSd7Zc3BGg0CA+NDHi3v
 BQSYdsRzz3AcC/HTs0PRiDdsagKU7TCMiPEqCyHEuvGzFDn9QjGXHRzSn+nq0dnlIeT7Tdb
 WL2d8RQ7BqD3U8zuE+GSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UjPUCyId88A=:kzRO6qxCEAoOTHcD+jcd7N
 KLT67mWwLtbwhSIfWEU5zaEhTw/OJH2xhB8ZN87LVNGUz4sIQtZozLifwbx6Ckw26+W3Lt8dd
 n2AdDaIjIzmvsc6CA6guxEO8P2hrBHNdMqHkMrex4Pi9pb5Iw44IvxZgtUu8Fty08CaP0PcUo
 iQzWLF4hTVJLhKRJ6vUDElVSI6XuGhahZ141iHZsgmGIfJfR4mxb0XD5TwU3FmHJ7r3AU197h
 soW335VKXkxLChT2AcFYXiKedAq9PFGEHVByW31feKvPWdVC5LC9sj8BFGhr5ocAZXYTHoNhw
 PlBntu1GVS9KnwXsi+npjqi3SEQW7xhjCbOhU7nCKslZU9sb1lAAnJp8wVrJtJVkmnLkF+Ibq
 GEA4KDFqoi5lCCd4D+rFUz1A3401wmNZHCbGds381+uOktzrQ/FSJK8tH55AyLk6beGHO8oER
 SLPXu68BzpUQ6GXJkV1USP/7c1DzoKMJzm8nVLlvpe2Gw3m5CJbfWBnEd+7YWNaIf6k0sR0dg
 XSgU6e+q9dA83/SEORS8V+3J2uP2wb1Xtb//otEi55xZz3NB2jS9Pt+rieVneHZgzp6Shs0R/
 9VQbBH1fnF6F/q8gisRcneh/cVFeprG5n3IJDPnpYhpmxhqxi3egZK+DX3XCHB9UCAFyvWvTr
 aSYdYF16whcKoA8jCRN/OrrIEI821SaT7yXcqwOeYYs2TmjpbIW2C1bpQVkr+mK/OfRwJ54hx
 vAuwyvgVFIYNLHIuAfNaoQP6atUeWk14rFofmlsIaEquGyENGSbYW0yxn9M=
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

I find it very hard to debug wireguard connections on mobile=2E

I think it might be great if the last handshake would be displayed, just l=
ike on the desktop implementations (win, Linux)=2E

This would really make life easier=2E It does not need to be the second -c=
ounting counter, a timestamp would be great=2E This way, all platforms woul=
d be equivalent, I=2Ee=2E you could always ask "is there a handshake time d=
isplayed"?

It looks like there is a pull request at=C2=A0https://github=2Ecom/WireGua=
rd/wireguard-android/pull/30/commits=C2=A0but I cannot judge the quality=2E

M
