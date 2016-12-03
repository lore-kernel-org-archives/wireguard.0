Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cee4814
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 22:16:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 701f5005
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 22:16:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4cdcfbbe
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 22:16:57 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id o141so218119167lff.1
 for <wireguard@lists.zx2c4.com>; Sat, 03 Dec 2016 14:21:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161203124233.27891-1-list@eworm.de>
References: <20161203123044.25848-1-list@eworm.de>
 <20161203124233.27891-1-list@eworm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 3 Dec 2016 23:21:51 +0100
Message-ID: <CAHmME9pAz1e2keE0vH-cWORP7pRmhfoivFt0_=_4xEH9xUjLDA@mail.gmail.com>
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

I like the general idea here of including dkim in WireGuard now, since
basically all distros use it and ship the exact same logic. By putting
it in WireGuard itself, I can provide maintenance over the
interworkings, which will be helpful for downstream.

Another thing I can do is handle the installation myself. `make dkim`
will then copy all the paths and create the dkim.conf file, etc. First
question: is there a standard destination path to which files should
be copied. Second question: what environment variable name do you
think would be appropriate for representing the destination address
(override)?
