Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61F9C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eed7f2a;
	Tue, 20 May 2025 19:54:49 +0000 (UTC)
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com
 [207.171.188.206])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 78d798a1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Feb 2025 03:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1740108413; x=1771644413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8mNjS6ciQxTju2qMj3xcfBbIY4//EJ+QLkySghPDl14=;
 b=NBBAUobzJpvgNC6H+GB38degD5n/b4HJpoLaNZ7g3LtagtxJv3Lsr8n/
 PRnV7nfOtduxTx0nGM+zN9hzYru6SdSX5eNzIM3B9iYi/eypuYt8vHo32
 fCWW51lPE7ffq7CzRXOUk+otjmUkL8J93Q7kdUUdzm7w2uMaMIOtNqXFl w=;
X-IronPort-AV: E=Sophos;i="6.13,303,1732579200"; d="scan'208";a="800651343"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:26:45 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.7.35:51797]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.18.70:2525]
 with esmtp (Farcaster)
 id 0699b55d-301b-4263-9bf9-a0cbd11131d6; Fri, 21 Feb 2025 03:26:43 +0000 (UTC)
X-Farcaster-Flow-ID: 0699b55d-301b-4263-9bf9-a0cbd11131d6
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Fri, 21 Feb 2025 03:26:43 +0000
Received: from 6c7e67bfbae3.amazon.com (10.135.209.63) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Fri, 21 Feb 2025 03:26:38 +0000
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
Subject: Re: [PATCH net-next v10 05/13] net: ip_tunnel: Don't set tunnel->net
 in ip_tunnel_init()
Date: Thu, 20 Feb 2025 19:26:29 -0800
Message-ID: <20250221032629.73823-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250219125039.18024-6-shaw.leon@gmail.com>
References: <20250219125039.18024-6-shaw.leon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.135.209.63]
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
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
Date: Wed, 19 Feb 2025 20:50:31 +0800
> ip_tunnel_init() is called from register_netdevice(). In all code paths
> reaching here, tunnel->net should already have been set (either in
> ip_tunnel_newlink() or __ip_tunnel_create()). So don't set it again.
> 
> Signed-off-by: Xiao Liang <shaw.leon@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
