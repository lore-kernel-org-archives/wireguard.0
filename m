Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809CFC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e272bd1;
	Tue, 20 May 2025 19:54:52 +0000 (UTC)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb4561b0
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2025 03:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1740108974; x=1771644974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFHrnoZA5yunh9fQerpN+ou0poPl6NY3Hw3Lua8KpXw=;
 b=IJhM8bSIgdD0Uvm7HZTqLw66MGFt4IL7ASYvdDkPYHxRqZ4iokkAIm1h
 UjFU6WT0nj3RTOSPl+OFco6LjhYnXa8NhqtMMmngCH9dUcfOiKoF9OIUg
 e/JkN7FI96/7hGS6eWmYpPSw1Cb+DIUMYFklcr45ZuYccIk1RtRW/IH64 I=;
X-IronPort-AV: E=Sophos;i="6.13,303,1732579200"; d="scan'208";a="495797487"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:36:06 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:31178]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.58:2525]
 with esmtp (Farcaster)
 id 8cb3c8f8-0a7a-4678-9917-956104d654d3; Fri, 21 Feb 2025 03:36:05 +0000 (UTC)
X-Farcaster-Flow-ID: 8cb3c8f8-0a7a-4678-9917-956104d654d3
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 21 Feb 2025 03:35:58 +0000
Received: from 6c7e67bfbae3.amazon.com (10.135.209.63) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 21 Feb 2025 03:35:52 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <shaw.leon@gmail.com>
CC: <alex.aring@gmail.com>, <andrew+netdev@lunn.ch>,
 <b.a.t.m.a.n@lists.open-mesh.org>, <bpf@vger.kernel.org>,
 <bridge@lists.linux.dev>, <davem@davemloft.net>, <donald.hunter@gmail.com>,
 <dsahern@kernel.org>, <edumazet@google.com>, <herbert@gondor.apana.org.au>,
 <horms@kernel.org>, <kuba@kernel.org>, <kuniyu@amazon.com>,
 <linux-can@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-ppp@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-wpan@vger.kernel.org>, <miquel.raynal@bootlin.com>,
 <netdev@vger.kernel.org>, <osmocom-net-gprs@lists.osmocom.org>,
 <pabeni@redhat.com>, <shuah@kernel.org>, <stefan@datenfreihafen.org>,
 <steffen.klassert@secunet.com>, <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v10 06/13] net: ip_tunnel: Use link netns in
 newlink() of rtnl_link_ops
Date: Thu, 20 Feb 2025 19:35:44 -0800
Message-ID: <20250221033544.74835-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250219125039.18024-7-shaw.leon@gmail.com>
References: <20250219125039.18024-7-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.135.209.63]
X-ClientProxiedBy: EX19D039UWA004.ant.amazon.com (10.13.139.68) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

From: Xiao Liang <shaw.leon@gmail.com>
Date: Wed, 19 Feb 2025 20:50:32 +0800
> When link_net is set, use it as link netns instead of dev_net(). This
> prepares for rtnetlink core to create device in target netns directly,
> in which case the two namespaces may be different.
> 
> Convert common ip_tunnel_newlink() to accept an extra link netns
> argument.
> 
> Signed-off-by: Xiao Liang <shaw.leon@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
