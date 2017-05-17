Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1865197a
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:57:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ee65fe6
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:57:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e464618
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:57:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a55d224b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:57:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l18so16378330oig.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 07:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1495029845.13481.33.camel@gmx.de>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau> <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
 <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
 <1495029845.13481.33.camel@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 16:08:59 +0200
Message-ID: <CAHmME9pQxx_-h=8a_YpRgGnidjOA8aJeT=Lz3v-RkB_17dP9jA@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: =?UTF-8?Q?Manuel_Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
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

Hi Manuel,

On Wed, May 17, 2017 at 4:04 PM, Manuel Sch=C3=B6lling
<manuel.schoelling@gmx.de> wrote:
> Great to hear that wireguard gets a nice IPC interface.
> Do you already know when this is about to land in the wireguard
> releases/repos?

When Trevor wakes up today and publishes rev32b of Noise, I'm planning
on releasing a snapshot of WireGuard seconds after. Currently 7am on
the pacific coast...

Jason
