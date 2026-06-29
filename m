Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA574CA6001
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 87cd7db4;
	Mon, 5 Oct 2026 06:59:48 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8a68c270
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2026 03:05:11 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=EIibuIXDCikSdjCUDVOb0Wa4HMb7+unZo9guX4Iva30iJvDU3dsbewUVeLflc3u6h2TP5+JE5azYx3YBlF+kBDgOKNk2MizdwenfpOYcGi/x5+obCD6/l4t71Uq+Jn6ypG4rlLv8sdgITjy+OcU48UUvsEzJsxSjDXOiDPM033MHXNrJtuYnl3yn51SIdexmTLTPBnJX8h4Z7Sm6A5O7zJpR5UZENLkEm7PazHwuHuKT7gWCgKco+v7g+Jj7d/v8vLPQMVMGhErNB7DXCvF5/knLWnVNjgCDSbw86HOay9lj3dWYCIrcGzgx6J/3F3TK2EFmZZMX/LtPVVhN78TpEg==;
 s=purelymail2; d=rcpassos.me; v=1;
 bh=oxCWPESbNzwIFVB4kYj7psqNxYCoUW/bo0AUA11NdOY=;
 h=Received:Date:From:To:Subject; 
DKIM-Signature: a=rsa-sha256;
 b=kHO+K8BnHLCk2mKmPQ20cBTbpWwELDm1rqwmrYi9+Gax5L8iwcbJyXGyiKZn2SoTGHvoWvPLrFg8nS06MTg1VokIztAb/jn5DXiv9HlhM3Mf/k8sVJ35lRAD0oRypXC0lUpIve+NKF22hahnBFNhmHvH2IcIBwUAYeW4W3l/ej1PeyOJanJ+mgeCJT05ac/qJ2ftVuPpkSQQ4xbws9BbU2AelNZB7D2uSs+h50vKjTXH71YG8tCSiCE69mxv/6UkOd4kRK4+Y5BlVOn7iCpfLQaGx32NMf/orb1WlDUAtZxXLqMCmfuwf8KrSQFIdhz86JazXJ2MUMBGX9tZuScvFw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=oxCWPESbNzwIFVB4kYj7psqNxYCoUW/bo0AUA11NdOY=;
 h=Feedback-ID:Received:Date:From:To:Subject; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2003467226; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 03:04:49 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 00:05:08 -0300
Message-Id: <DJL786MPR9HO.BWHI3U37PDVM@rcpassos.me>
Cc: "Rafael Passos" <rafael@rcpassos.me>, <Jason@zx2c4.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com>,
 <syzkaller-bugs@googlegroups.com>, <wireguard@lists.zx2c4.com>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Theodore Tso" <tytso@mit.edu>, "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH] Wireguard: Fix data-race in rx/tx counter
X-Mailer: aerc 0.21.0
References: <DJFTVX3FE7OD.2O8GTO84798T@rcpassos.me>
 <20260628203823.144789-1-rafael@rcpassos.me>
 <aa423184-7465-4bc9-aff4-d3d671beb3c6@lunn.ch> <akHY4UEa1ab2PF-j@mit.edu>
In-Reply-To: <akHY4UEa1ab2PF-j@mit.edu>
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

On Sun Jun 28, 2026 at 11:34 PM -03, Theodore Tso wrote:
> One of the reasons why kcsan and syzbot can be quite noisy is that a
> human being needs to *think* and consider whether or not this is
> actually important.  (One of the reasons why I'm not all that worried
> about our new AI overlords taking over the world.  :-) Consider what
> is the worst that might happen if the tx/rx_bytes counter might not be
> completely accurate?  Is it worth the performance penalty of using
> atomics (or the memory overhead of per-CPU counters)?
Yeah, I guess not.
Still, it was very interesting learning all this. I only knew per-cpu
counters by name, and Andrew's response led me to actually understand it.

I would like to thank you both!
And if I may, I would like to send my v2 patch (as a response in this
thread) just because it was very fun making and testing it. And I would
love feedback on it, if anything looks wrong. This was an amazing
learning opportunity for me.

Thanks,
Rafael Passos
