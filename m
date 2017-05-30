Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c885f501
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:35:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52fe4ed5
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:35:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c9a6c7b
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:46:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0b5eac6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 11:46:33 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id h4so107644858oib.3
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 04:48:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
References: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 May 2017 13:48:07 +0200
Message-ID: <CAHmME9rtEXCHG6LE+JP7jaDnM7cR+faJOAKJLW0bMBKawoZZ0Q@mail.gmail.com>
Subject: Re: Kernel panic on ARM
To: Alexandre Karlov <bassbeat@gmail.com>
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

Hey Alexandre,

Thanks for the detailed debug logs. Is this with the latest snapshot
(0.0.20170517) or with the master git repo? I ask because I recently
added some unreleased-and-potentially-unstable ARM-specific changes to
the master branch, which I'm still trying to get right.

Jason
