Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52cc73bf
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 10:39:29 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dbdcb0f
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 10:39:29 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z73so7876281wrb.0
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 03:53:38 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.218])
 by smtp.gmail.com with ESMTPSA id 63sm636539wrn.12.2018.04.13.03.53.35
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Apr 2018 03:53:36 -0700 (PDT)
Message-ID: <1523616813.12730.40.camel@gmail.com>
Subject: WireGuard integration with a DHCP server/client or other automatic
 provisioning
From: ST <smntov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Fri, 13 Apr 2018 13:53:33 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

as mentioned earlier I'm looking for ways to automate IPs assignment and
more general - addition of new peers into a VPN through a central WG
server.

It was suggested to use DHCP server/client. Are there tutorials
somewhere on how to do that?

Maybe you are aware of other established/tested options, like scripts
which are parts of other projects, similar to:

https://github.com/aparcar/wireguard-provisioning

Thank you!
