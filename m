Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B06FEB64D9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Jul 2023 13:50:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a86c724f;
	Sun, 2 Jul 2023 13:47:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fe30897
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jul 2023 13:47:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B3A6360C24
 for <wireguard@lists.zx2c4.com>; Sun,  2 Jul 2023 13:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DE8C433C9
 for <wireguard@lists.zx2c4.com>; Sun,  2 Jul 2023 13:46:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Zk5MeBPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1688305613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DgyTZpYH4n9IkxjItDbDmUhF/fhQUb1wwAJFpzqh190=;
 b=Zk5MeBPwfSW2n6S0hurtfsv37B2KBfPoDKpwtPYaU4YjNrbK5UeNyWtPg3kZ9sEIzGgYmG
 eMZisM2BYTvZL15MxAQ08AXbrj/1WgSB83k0VM3+pD11YYEeiEDpHcVIq5sGjpA68cUOVr
 roKu6D7dy7GuGSzfcBs0KssjpjyC7eA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba0f1640
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Jul 2023 13:46:52 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4436dc265d6so1160365137.0
 for <wireguard@lists.zx2c4.com>; Sun, 02 Jul 2023 06:46:51 -0700 (PDT)
X-Gm-Message-State: ABy/qLbnfVPxRp4ZbeuyNPfmXqt7+aGWU7sTpdcGh+5PCdaxIuv1rwfH
 cD+WEIh7alebGsbEStKpNBEyyJwakdW7t1soya0=
X-Google-Smtp-Source: APBJJlGqQFeoUfE02AmvsH2pJ+qPAs8UdnGuzSAglr4yxRzNPQyJCtBP9XKz1B4Kp4ZazFDt6bCHMPcaSpg4TPOUzY0=
X-Received: by 2002:a67:f94c:0:b0:443:7e49:c023 with SMTP id
 u12-20020a67f94c000000b004437e49c023mr3929865vsq.6.1688305609944; Sun, 02 Jul
 2023 06:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
In-Reply-To: <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 2 Jul 2023 15:46:38 +0200
X-Gmail-Original-Message-ID: <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
Message-ID: <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Eric DeVolder <eric.devolder@oracle.com>, 
 "Borislav Petkov (AMD)" <bp@alien8.de>, David R <david@unsolicited.net>, 
 Boris Ostrovsky <boris.ovstrosky@oracle.com>,
 Miguel Luis <miguel.luis@oracle.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Jay Vosburgh <j.vosburgh@gmail.com>, 
 Andy Gospodarek <andy@greyhouse.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux RCU <rcu@vger.kernel.org>,
 Wireguard Mailing List <wireguard@lists.zx2c4.com>, 
 Linux Networking <netdev@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, 
 "Manuel 'satmd' Leiner" <manuel.leiner@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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

I've got an overdue patch that I still need to submit to netdev, which
I suspect might actually fix this.

Can you let me know if
https://git.zx2c4.com/wireguard-linux/patch/?id=54d5e4329efe0d1dba8b4a58720d29493926bed0
solves the problem?

Jason
