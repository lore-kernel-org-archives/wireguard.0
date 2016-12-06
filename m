Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9dc1ee25
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:51:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5406ed15
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:51:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2de5d011
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:51:58 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f82so137394602wmf.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Dec 2016 10:57:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rxy-tzWdOYontRYDkxwWAgyx6jPURej1Qh2brMcrDEjw@mail.gmail.com>
References: <20161203123044.25848-1-list@eworm.de>
 <20161203124233.27891-1-list@eworm.de>
 <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
 <20161206103551.038a3d3e@leda>
 <CAHmME9rxy-tzWdOYontRYDkxwWAgyx6jPURej1Qh2brMcrDEjw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Dec 2016 19:57:16 +0100
Message-ID: <CAHmME9p8VJaGADvJUiK9kFcfRozq1bWa-=U8H0q_9eaNDjoVOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] add dkms configuration file dkms.conf
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Here's what the change looks like in the gentoo ebuild:
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=5162a26ae15cd7ce4c1aa4c5b8a053e2043aec71
