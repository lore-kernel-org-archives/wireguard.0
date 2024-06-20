Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B3DC2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 Jun 2024 23:08:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da94aef4;
	Thu, 20 Jun 2024 23:08:27 +0000 (UTC)
Received: from mail3.molgaard.org (mail3.molgaard.org [116.203.246.174])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec0ae024
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Jun 2024 23:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail3.molgaard.org (Postfix) with ESMTP id 70CD73E8F6
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 01:08:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail3.molgaard.org
Received: from mail3.molgaard.org ([127.0.0.1])
 by localhost (mail3.molgaard.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkMZlAF83uxc for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jun 2024 01:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=molgaard.org; s=mail;
 t=1718924898; bh=oRtIgWfzVe1z7P8TbEtXbyryr0zRTOUWcANGreur8u8=;
 h=Date:To:From:Subject:From;
 b=T4djd7YzZZ37mBdR9lOofvUeNhwAtVQ6YrAuq02MDMJlTC6QShYMy3QtB0QquAa2v
 jq8k0eA4M6jOYLs9kjxgp0zP11BpxKNoeVrbM8xPV8inoSfHRM78Xu01DCdFmTK8pY
 b7vfsZzoLxg1thvHE//s0UhDLQlQF9NCfIevXNYLjovV0+gTHz0DizZVclSN9RzII0
 TgETbeHEOnFt5Og6LeYnPAN6dInXYSISQJ3rBsUg9PZsXQB72vHAhDDgGrw6XsmX6s
 H3M+8G8cTgrzg1can8IJ0RF669E6TDn9xG7YzMnRV6JC/f5eHF2s6M4D9NbcPbKjK/
 avew38LYN9/bw==
Received: from [IPV6:2a06:4005:608b:0:e9a:8623:996e:c3e1]
 (2a06.4005.608b.0000.0e9a.8623.996e.C3E1.static6.kviknet.net
 [IPv6:2a06:4005:608b:0:e9a:8623:996e:c3e1])
 by mail3.molgaard.org (Postfix) with ESMTPSA id 54A9E3E8AD
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jun 2024 01:08:18 +0200 (CEST)
Message-ID: <c331bdd1-100c-4ada-a973-5942d36ea39b@molgaard.org>
Date: Fri, 21 Jun 2024 01:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
Content-Language: da-DK, en-GB
From: =?UTF-8?Q?Sune_M=C3=B8lgaard?= <sune@molgaard.org>
Subject: Multicast on Android?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Is it currently possible to enable multicast on the wireguard device 
under Android, in order to, e.g., access DLNA services?

If not, is it feasible to implement?

Best regards,

Sune Mølgaard

