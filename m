Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12702C54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 16:10:18 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c19fea6;
	Tue, 20 May 2025 19:41:28 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 597cfc91
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Feb 2025 12:51:41 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22104c4de96so70830935ad.3
 for <wireguard@lists.zx2c4.com>; Wed, 19 Feb 2025 04:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739969499; x=1740574299; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RiGtI+5ToMID9TUSdNCghgiM3EXs9/d4cQAhclrcdwo=;
 b=feC0QjfLgjKKpIbZxdWObskOfa6fqJAQ09bR1fe8nHz77kUPwwKmFZxYs/R81a53p4
 5+XZlQ7IwXPYY1ElaIZ1Q/UsgscEE+zgBd8rd8Z3KhkAtCzeqy+MUH+VnWO3pob292xV
 t0w2aalxK+V/61usa6XxS75cUuXXr/SnUnMkouesHr/LuGgVFhTMQGY5aaqG/isEIMMi
 HOIyESbORAk/BrL3LKvFvQSGKT181pBToafSBnmraous52Z808Sxv5TVK3Mmr/owAgoP
 +ziHcXGWjZVs57vOFqS1CYbDz/dLj2UIbxQXCco8wP+TPlSXJ+pUJwUgYg/vU0SwmyPo
 NCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969499; x=1740574299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RiGtI+5ToMID9TUSdNCghgiM3EXs9/d4cQAhclrcdwo=;
 b=n0J+mcJg64Cd6vDixoIQWO0fnFP8HBxpCj2QPbEz1H3J3dAiD/EdzUeOndR6/mRunw
 J1fs3JkWsLU/IkWVjog5M4v1WSaBGOcnzTgc31pLWvUKXPXlk4KnHHIzlYUBFC8ckNdI
 C1l7XCdlNf48FPyLotsgJmiE3HGpoE7RRpNKJxFt4g993hhRPVIxCc99DVcBEChECEhI
 HaGL4zaVarqieo40jyBlr6JKA0XqZ+PjFlmg+Ny2JHw1O53jRFJQFg1e9yayiJe2VG3o
 DCnxsT+wsAAOyN08pda9vsEK/fQbhhdFGzRqyXVIS51l8l48Cw8Cdsto0PX9HWgMXGfD
 m0Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe6WSIVop1yPGyybEYUYdDASyX3b6IhlGdSe3sTS43avkm0ipYwc+1XBZ45XAPwoi6V04/MosZdUI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxpz1EchhuJM6c46zFmDb/+1XDq++97wTMv846qj9cvw6m5sZ56
 8h6B6sQGlB65yBcKx63HmF68//D1L+/bYWT7sS6tbUerwdpUUmpb
X-Gm-Gg: ASbGnctKhxieaMkFqlu/Z++OTtH/3Kw/gL5rlxxGr40tehenStcpIo1fCnN1En1W+PR
 NYKU1fyjL8UU9feWZCbNez9d6dDk9VL+yheil9b/APzISEx+AV/6ygRpGtkfhn4O0ztUnoAC8/x
 Q3fbfRLe2rWC6F3yI7Nl5ROPiDYUhuk6S090o30VC3GNrpqoLyDeJr0Apg1F0KwD9lyoVFPH3Yh
 HtzpNUn3CIpFykhOYQ8vkBPLi91YM78SpGy+tMhitWTz4gD8gFfaHI0Pj+L8ARQ/Lw4KmHvHKtu
 hQkgVA==
X-Google-Smtp-Source: AGHT+IFttmTeAFp7rRNlCvGNA6c3f8HloQtXmzYtg/s+sWnJsGTKFqc7jLE1fU4ek1ihZeJfgcA+rA==
X-Received: by 2002:a17:902:ec83:b0:21f:5933:b3eb with SMTP id
 d9443c01a7336-22104087bc1mr237554135ad.31.1739969499276; 
 Wed, 19 Feb 2025 04:51:39 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d536436fsm103427175ad.64.2025.02.19.04.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:51:38 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 05/13] net: ip_tunnel: Don't set tunnel->net in
 ip_tunnel_init()
Date: Wed, 19 Feb 2025 20:50:31 +0800
Message-ID: <20250219125039.18024-6-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250219125039.18024-1-shaw.leon@gmail.com>
References: <20250219125039.18024-1-shaw.leon@gmail.com>
MIME-Version: 1.0
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

ip_tunnel_init() is called from register_netdevice(). In all code paths
reaching here, tunnel->net should already have been set (either in
ip_tunnel_newlink() or __ip_tunnel_create()). So don't set it again.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 net/ipv4/ip_tunnel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index 09b73acf037a..dd4b4e5be998 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -1326,7 +1326,6 @@ int ip_tunnel_init(struct net_device *dev)
 	}
 
 	tunnel->dev = dev;
-	tunnel->net = dev_net(dev);
 	strscpy(tunnel->parms.name, dev->name);
 	iph->version		= 4;
 	iph->ihl		= 5;
-- 
2.48.1

