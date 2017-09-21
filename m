Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0497d35
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 10:58:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01690611
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 10:58:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10fb6f89
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:17:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6179eed8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 11:17:13 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id w94so10024545ioi.7
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 04:25:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
References: <CADdae-hcrAL6-pMPwVOmGe3cb299jtUj68WVbz3EU5MmGQbtaQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 21 Sep 2017 13:25:31 +0200
Message-ID: <CAHmME9oMQ+3yUA8Da-m8YAkNgJ-aJ3uRuhp-uHJq_mRQ1hJDDQ@mail.gmail.com>
Subject: Re: [wireguard-dev] Ability to use one udp port for multiple wg
 interfaces
To: nicolas prochazka <prochazka.nicolas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'd recommend you use multiple peers per interface. The strong binding
with allowed-ips enables you to use qos, network analysis, security,
and iptables rules in a very straightforward way.
