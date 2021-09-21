Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBB2C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:17:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D02360EFF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 04:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D02360EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64cfd87a;
	Wed, 22 Sep 2021 04:14:40 +0000 (UTC)
Received: from st43p00im-zteg10071901.me.com (st43p00im-zteg10071901.me.com
 [17.58.63.169])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37fb790a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Sep 2021 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1632223001;
 bh=iscXbm2rWU1WL8FTqrzEBDOHF1yJDDKucGBtMvdiuHk=;
 h=From:Content-Type:Mime-Version:Subject:Date:To:Message-Id;
 b=EoG0iceD3FLZAg842fWiF2ecbBGtTj/qkdw3RxRod19FpLsHV1bo10Y/LudgyJ/yS
 PqFJCk6tkPQsgmanV/JYI5/N4mW2BTXIY6P6Io5arIVd+lHtZ6ewtNhls3qUSP3gzD
 Im0RUZjw+4rGJoKs7P3534adyUM4mxpKpAomtugxrXhn5s8f2//1PcqePm3MFbD/Hc
 alGj5n65FB44yvi7nHbU7wEGv0vV6BaD/LMtdIRMf+3vgFOelH+gr0td/3976nNS8r
 H53sb0BA/jqp3E/qj2h6nLDutlr9QvnradQEcjFlQAG6iujZm2pz+1VDUuMUenGpgn
 KZJBYsZfg46xQ==
Received: from smtpclient.apple (unknown [2.222.11.82])
 by st43p00im-zteg10071901.me.com (Postfix) with ESMTPSA id CA321D80DBA
 for <wireguard@lists.zx2c4.com>; Tue, 21 Sep 2021 11:16:40 +0000 (UTC)
From: Chi Wing Wong <hklbj@icloud.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Error to compile Wireguard for SUSE LES 15 SP3
Date: Tue, 21 Sep 2021 12:16:39 +0100
References: <204FE162-0DEE-47E2-B345-0DFB5FE20325@icloud.com>
To: wireguard@lists.zx2c4.com
In-Reply-To: <204FE162-0DEE-47E2-B345-0DFB5FE20325@icloud.com>
Message-Id: <A98A7E01-FC85-45C0-9ACD-A02A60866F65@icloud.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.391,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-09-20=5F11:2021-09-20=5F01,2021-09-20=5F11,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2109210071
X-Mailman-Approved-At: Wed, 22 Sep 2021 04:14:37 +0000
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


> Hi,
>=20
> I am new to wireguard and tried to install via compiling the latest =
version (from git) of Wireguard-Linux-compat for my SUSE Linux =
Enterprise server 15 SP3. However, there are 2 errors prompted during =
compiling. I have checked the mail archive mentioned about similar =
issue. However, I could not find the mentioned patch to resolve the =
error. Could you share any reference for me to tackle it? Many Thanks.
>=20
>=20
> In file included from <command-line>:0:0:
> /home/optionmaker/wireguard-linux-compat/src/compat/compat.h:1036:20: =
error: redefinition of =E2=80=98skb_reset_redirect=E2=80=99
>  static inline void skb_reset_redirect(struct sk_buff *skb)
>                     ^~~~~~~~~~~~~~~~~~
> In file included from =
/home/optionmaker/wireguard-linux-compat/src/compat/compat.h:870:0,
>                  from <command-line>:0:
> /usr/src/linux-5.3.18-59.19/include/linux/skbuff.h:4543:20: note: =
previous definition of =E2=80=98skb_reset_redirect=E2=80=99 was h
> ere
>  static inline void skb_reset_redirect(struct sk_buff *skb)
>                     ^~~~~~~~~~~~~~~~~~
> In file included from =
/home/optionmaker/wireguard-linux-compat/src/compat/compat.h:870:0,
>                  from <command-line>:0:
> /usr/src/linux-5.3.18-59.19/include/linux/skbuff.h:4543:20: note: =
previous definition of =E2=80=98skb_reset_redirect=E2=80=99 was h
> ere
>  static inline void skb_reset_redirect(struct sk_buff *skb)
>=20
>=20
>=20
> /home/optionmaker/wireguard-linux-compat/src/compat/compat.h: At top =
level:
> /home/optionmaker/wireguard-linux-compat/src/compat/compat.h:1065:22: =
error: static declaration of =E2=80=98ip_tunnel_parse
> _protocol=E2=80=99 follows non-static declaration
>  static inline __be16 ip_tunnel_parse_protocol(const struct sk_buff =
*skb)
>                       ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from =
/usr/src/linux-5.3.18-59.19/include/net/gre.h:6:0,
>                  from =
/usr/src/linux-5.3.18-59.19/include/linux/netfilter/nf_conntrack_proto_gre=
.h:5,
>                  from =
/usr/src/linux-5.3.18-59.19/include/net/netfilter/nf_conntrack.h:23,
>                  from =
/home/optionmaker/wireguard-linux-compat/src/compat/compat.h:947,
>                  from <command-line>:0:
> /usr/src/linux-5.3.18-59.19/include/net/ip_tunnels.h:294:8: note: =
previous declaration of =E2=80=98ip_tunnel_parse_protocol
> =E2=80=99 was here
>  __be16 ip_tunnel_parse_protocol(const struct sk_buff *skb);
>         ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from =
/usr/src/linux-5.3.18-59.19/include/net/gre.h:6:0,
>                  from =
/usr/src/linux-5.3.18-59.19/include/linux/netfilter/nf_conntrack_proto_gre=
.h:5,
>                  from =
/usr/src/linux-5.3.18-59.19/include/net/netfilter/nf_conntrack.h:23,
>                  from =
/home/optionmaker/wireguard-linux-compat/src/compat/compat.h:947,
>                  from <command-line>:0:
> /usr/src/linux-5.3.18-59.19/include/net/ip_tunnels.h:294:8: note: =
previous declaration of =E2=80=98ip_tunnel_parse_protocol
> =E2=80=99 was here
>  __be16 ip_tunnel_parse_protocol(const struct sk_buff *skb);
>=20
>=20
>=20
> In file included from <command-line>:0:0:
> /home/optionmaker/wireguard-linux-compat/src/compat/compat.h:1078:32: =
error: static declaration of =E2=80=98ip_tunnel_heade
> r_ops=E2=80=99 follows non-static declaration
>  static const struct header_ops ip_tunnel_header_ops =3D { =
.parse_protocol =3D ip_tunnel_parse_protocol };
>                                 ^~~~~~~~~~~~~~~~~~~~
> In file included from =
/usr/src/linux-5.3.18-59.19/include/net/gre.h:6:0,
>                  from =
/usr/src/linux-5.3.18-59.19/include/linux/netfilter/nf_conntrack_proto_gre=
.h:5,
>                  from =
/usr/src/linux-5.3.18-59.19/include/net/netfilter/nf_conntrack.h:23,
>                  from =
/home/optionmaker/wireguard-linux-compat/src/compat/compat.h:947,
>                  from <command-line>:0:
> /usr/src/linux-5.3.18-59.19/include/net/ip_tunnels.h:293:32: note: =
previous declaration of =E2=80=98ip_tunnel_header_ops=E2=80=99 w
> as here
>  extern const struct header_ops ip_tunnel_header_ops;
>=20
>=20
> Regards,
> Wing

