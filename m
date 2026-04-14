Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321CF9D0D3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2026 15:40:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 70701a4c;
	Tue, 14 Apr 2026 15:40:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7c9a956f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 15:40:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 308EC600CB
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0974C2BCB6
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 15:40:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="hcJLcAVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1776181217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNEgoftVnqoHxChDeFRkfLMjkNJ9rWqwQSFm616iVJo=;
 b=hcJLcAVtp/lhy/6qIa1d586uxjXRaJek6BpZ1pAlo0kTkFQH9N2T9hhEBIRQU3VeFAjVIa
 78Di1AG3BY8qK+sMyc0zYhpQk19/sEi1mi4TLsdfxHwBE9ED8+8Ni2sFqQJol9FMzW+5Ee
 JxI477YaSaXBqowBXv8pHArJZkKaD4k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 20cd0b0a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 15:40:17 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-464bba3a9easo2837071b6e.0
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2026 08:40:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ9pmS2KpvRNO54X+fD+b9u36OUBuFztGLdSI7FDtSBcZtDLbQoJXE1yep7Sizlw45tslNmYjcEtkOA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyBiFOt6p+QZ8vCqs9R3UM4aFdfgS4mcwZ2vRcEopmIsH6MkyiM
 N8CQCiZkwh8n2+Q99su3Lqqz41/4a6DsHhDNKJo79OiUCtqEDWzTxFnpYxehi2k4H3dWF4iiQ4E
 ohXWfRW/O9mVlcMF8vWNvVw0VouudIG4=
X-Received: by 2002:a54:4386:0:b0:45f:2788:b006 with SMTP id
 5614622812f47-4789a7837a7mr6900130b6e.0.1776181215218; Tue, 14 Apr 2026
 08:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260413151232.1004611-1-shardul.b@mpiricsoftware.com>
 <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
 <20260414081824.0edf6113@kernel.org>
In-Reply-To: <20260414081824.0edf6113@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Apr 2026 17:40:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9rwKae5b9PYzuqmwG3p05iZ=jqyp6LQefg0OsB3OP6oWg@mail.gmail.com>
X-Gm-Features: AQROBzDS9-WdOFRB3RLO4RUiIqKfEG5TSyNuS3pFkcbRNyBINYjricSkOHLuOXs
Message-ID: <CAHmME9rwKae5b9PYzuqmwG3p05iZ=jqyp6LQefg0OsB3OP6oWg@mail.gmail.com>
Subject: Re: [PATCH v2] wireguard: device: use exit_rtnl callback instead of
 manual rtnl_lock in pre_exit
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shardul Bankar <shardul.b@mpiricsoftware.com>, kuniyu@google.com,
 andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, janak@mpiric.us, kalpan.jani@mpiricsoftware.com, 
 shardulsb08@gmail.com, syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 14, 2026 at 5:18=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 14 Apr 2026 15:28:37 +0200 Jason A. Donenfeld wrote:
> > Thanks. Applied to the wireguard tree, and also added the missing
> > __net_exit and __read_mostly annotations in the process.
>
> Hi Jason, while we have you - do you have a PR for us for wireguard?
> We're going to be sending the net-next PR later today..

Sent!
