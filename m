Return-Path: john@mib-infotech.co.nz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07769817
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 05:29:05 +0000 (UTC)
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 151957b4
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Dec 2016 05:29:05 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id g1so8954282pgn.0
 for <wireguard@lists.zx2c4.com>; Sat, 17 Dec 2016 21:35:50 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
Received: from ?IPv6:2001:4428:200:8171:e4da:94b6:a3e9:5e92?
 ([2001:4428:200:8171:e4da:94b6:a3e9:5e92])
 by smtp.googlemail.com with ESMTPSA id 16sm22165359pfy.4.2016.12.17.21.35.46
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Dec 2016 21:35:47 -0800 (PST)
Subject: MTU
To: wireguard@lists.zx2c4.com
References: <CAHmME9o_BzZRj2HVpQMUxE7t1DS_NcHJWXe8zsvndNbwu+j+Qg@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <1d684ee8-9f6c-a9f0-4cec-df0116cb97b7@mib-infotech.co.nz>
Date: Sun, 18 Dec 2016 18:33:19 +1300
MIME-Version: 1.0
In-Reply-To: <CAHmME9o_BzZRj2HVpQMUxE7t1DS_NcHJWXe8zsvndNbwu+j+Qg@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
Did we have to configure our interfaces with a reduced MTU (1417) after
this last  update?

I've getting results reminiscent of the need for MSS clamping.
Connects ok, timeouts on transfer etc.

--John
