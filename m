Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A031AF9D0D3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2026 15:18:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1e998f41;
	Tue, 14 Apr 2026 15:18:30 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 445a9823
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2026 15:18:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3622E60018;
 Tue, 14 Apr 2026 15:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D8FC19425;
 Tue, 14 Apr 2026 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776179905;
 bh=CTs88kR+lYg3YXafFIcO3Qff52Oz6AF22ixIJ7VDM3k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rs+9c+Kl7G1HTOCcI2BKv/3KbyBk5RFrut3aAcLVPxflKbCGwdAiMwSkUAW2Rubtl
 REDENYaPsjgQOVCnFX8BkqScY1fL6uoAoX7YsLkpd6O6TwuUNQDnd8ntMeKENc0XGf
 9OBGw+57y25XBcwsUKXt7E0NGwI1CBWtlfLe/8QOSpcqqdTeYWGvt+b3Jm2K3k/4Ib
 Dv9ZFBwbhS9IUvw26garG+Y5j9fJleBRuVmqARNqla83yNPQjSW+CioTETAuPMY/V1
 HeF1EVhmm5jw5MxQb2vw3aL/C9PY7UmRe9518skDgzZp8bjxVqXss7/gv+MUduLQRi
 dslGvXVWyhxRQ==
Date: Tue, 14 Apr 2026 08:18:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shardul Bankar <shardul.b@mpiricsoftware.com>, kuniyu@google.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, janak@mpiric.us,
 kalpan.jani@mpiricsoftware.com, shardulsb08@gmail.com,
 syzbot+f2fbf7478a35a94c8b7c@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] wireguard: device: use exit_rtnl callback instead of
 manual rtnl_lock in pre_exit
Message-ID: <20260414081824.0edf6113@kernel.org>
In-Reply-To: <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
References: <20260413151232.1004611-1-shardul.b@mpiricsoftware.com>
 <CAHmME9oXoXykXq_emkA3v8nG2VR28CmRP2+WmhrvGJc0ZbPfpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 14 Apr 2026 15:28:37 +0200 Jason A. Donenfeld wrote:
> Thanks. Applied to the wireguard tree, and also added the missing
> __net_exit and __read_mostly annotations in the process.

Hi Jason, while we have you - do you have a PR for us for wireguard?
We're going to be sending the net-next PR later today..
