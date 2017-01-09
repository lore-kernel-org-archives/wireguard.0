Return-Path: ameretat.reith@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64621086
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 08:36:44 +0000 (UTC)
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ae4f04b
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 08:36:44 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 194so6644291pgd.0
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 00:46:19 -0800 (PST)
Return-Path: <ameretat.reith@gmail.com>
Received: from localhost (krnltest.xen.prgmr.com. [71.19.154.57])
 by smtp.gmail.com with ESMTPSA id z9sm178553308pge.44.2017.01.09.00.46.16
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Jan 2017 00:46:17 -0800 (PST)
From: Ameretat Reith <ameretat.reith@gmail.com>
To: <wireguard@lists.zx2c4.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
Date: Mon, 09 Jan 2017 12:16:22 +0330
MIME-Version: 1.0
Message-ID: <d05b5f22-2c63-455a-b9d7-7526f8c867d2@gmail.com>
In-Reply-To: <20170108224117.GB9445@tuxmachine.polynome.dn42>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Another use case would be circumventing some crazy state backed firewalls
that drop or throttle -mostly UDP- connections having high bandwidths.  If
peer is being used as gateway and nameserver resolver, it can be used to
rotate server IPs too; yet another method to bypass kind of blockages.
