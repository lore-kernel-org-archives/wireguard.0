Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF20CA5FE4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  3 Oct 2026 20:19:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 81abdddc;
	Sat, 3 Oct 2026 20:19:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e47fcd5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Oct 2026 20:19:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B5F360120;
 Sat,  3 Oct 2026 20:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47D31F0089B;
 Sat,  3 Oct 2026 20:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791058781;
 bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PWZph68PirMsQXPtMU5Zuk+nhWTztWdKlewvV/bvw2n/mzEgfznBR5pKIuheVfx9k
 Yhqi+9UFaxzqdhswnIMZcomJF1USxKs1yBGKTuATiAsjCSnvglzsW/NhV7HDKbd7zI
 6EvXpbxoH8m+IHSZ56cf5umrGiJY0QQ8gwieSeI2QGmuXx4KaLccMwOSCyYVRS04F8
 ky9qHTcpLiyKBxGkk+bspesPBZ4sktzs1318v+Z89WtFod58cW0XkFTFQdP+M01v+y
 ydAdXCeUwJa7+1toa/dyj/XIZMP9iMzTgmFTuXEXNhmTuRN5D7Y7w4f4u3QbaHmBa3
 5r/MHpY8fhxIg==
From: netdev-bot+sinfo@kernel.org
To: Andrii Pasichnyk <apasichnik9@gmail.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] wireguard: peer: free packets left on the per-peer
 queues on removal
Date: Sat, 03 Oct 2026 20:19:40 +0000
Message-ID: <179105878022.1402591.10615903497956533993@kernel.org>
In-Reply-To: <20261003201625.4572-1-apasichnik9@gmail.com>
References: <20261003201625.4572-1-apasichnik9@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
