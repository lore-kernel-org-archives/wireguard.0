Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54930C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 11:16:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32363611C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 11:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32363611C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7424f06d;
	Fri, 15 Oct 2021 11:15:30 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45a9890c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 11:15:27 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id 96691101371
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 13:15:27 +0200 (CEST)
Received: from m14060.contaboserver.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id BFE1C101440
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 13:15:23 +0200 (CEST)
Received: from mail-qt1-f179.google.com ([209.85.160.179]:35716)
 by m14060.contaboserver.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <ch@ntrv.dk>) id 1mbLBN-0005Nr-L6
 for wireguard@lists.zx2c4.com; Fri, 15 Oct 2021 13:15:23 +0200
Received: by mail-qt1-f179.google.com with SMTP id c20so8425501qtb.2
 for <wireguard@lists.zx2c4.com>; Fri, 15 Oct 2021 04:15:22 -0700 (PDT)
X-Gm-Message-State: AOAM530hEPTuM9ZKD7E97SVgQ0eBLF65KL6l8TlHu+jm5s8lAoiMUPYc
 3AHKP/l21E0Fd2YyJ66UucGcGWDxYZg7+s8gGEA=
X-Google-Smtp-Source: ABdhPJzfpGPSLBVd2w4UtO2po4uZxPVrdu36fuMDQTOhzPqasIBslzKYaO76Ehn4HgY/pTxDsmb4DK5ICzUgoeVoVZQ=
X-Received: by 2002:a05:622a:1992:: with SMTP id
 u18mr12252746qtc.234.1634296521785; 
 Fri, 15 Oct 2021 04:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
 <87ee8m1to8.fsf@toke.dk>
In-Reply-To: <87ee8m1to8.fsf@toke.dk>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Fri, 15 Oct 2021 13:14:45 +0200
X-Gmail-Original-Message-ID: <CA+cYV6vZsbkKyPGvkEF+WbJgi5KQhS46X0yvB3ExfXzr8g4i3Q@mail.gmail.com>
Message-ID: <CA+cYV6vZsbkKyPGvkEF+WbJgi5KQhS46X0yvB3ExfXzr8g4i3Q@mail.gmail.com>
Subject: Re: Source IP for multihomed peer
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Cc: Svenne Krap <svenne@kracon.dk>, 
 "WireGuard List (wireguard@lists.zx2c4.com)" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - m14060.contaboserver.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ntrv.dk
X-Get-Message-Sender-Via: m14060.contaboserver.net: authenticated_id:
 ch@ntrv.dk
X-Authenticated-Sender: m14060.contaboserver.net: ch@ntrv.dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

On Fri, 15 Oct 2021 at 12:14, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.d=
k> wrote:
> > 2) Is there any way to force the source ip of the connection from boxA
> > to always use address boxA1 ?
>
> In theory this should be possible to enforce via policy routing. Just
> tried this on a simple veth setup:
>
> # ip a add 10.11.1.1/24 dev veth0
> # ip a add 10.11.2.1/24 dev veth0
> # ping 10.11.1.2 -c 1
> 12:09:22.385888 IP 10.11.1.1 > 10.11.1.2: ICMP echo request, id 15, seq 1=
, length 64
> 12:09:22.385903 IP 10.11.1.2 > 10.11.1.1: ICMP echo reply, id 15, seq 1, =
length 64
>
> # ip r add 10.11.1.2 src 10.11.2.1 dev veth0
> # ping 10.11.1.2 -c 1
> 12:09:53.251386 IP 10.11.2.1 > 10.11.1.2: ICMP echo request, id 16, seq 1=
, length 64
> 12:09:53.251403 IP 10.11.1.2 > 10.11.2.1: ICMP echo reply, id 16, seq 1, =
length 64
>
> I think this ought to work for wireguard's source selection as well. If
> you don't have a particular destination, you should be able to do
> something similar based on sports with ip-rule using the wireguard
> source port:
>
> # ip rule add sport 1234 lookup 100
> # ip route add table 100 default via 1.2.3.4 src 3.4.5.6
>
> That last bit I didn't test, though...

Will have to test this later.

If this works. This suggestion would be a great enhancement to wireguard-to=
ols?

