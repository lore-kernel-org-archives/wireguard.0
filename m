Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f819651d
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:06:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3772a6e
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:06:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3e3ffe4
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:06:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1cedb744
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 14:06:31 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id h4so16703416oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 07:17:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170517161448.6b56f107@msi.defcon1>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau> <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
 <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
 <20170517161448.6b56f107@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 16:17:53 +0200
Message-ID: <CAHmME9rVrfuO4_T7RYzPMX7J-XkJCXb-Pv96AYpFqVmqgZKNsw@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: Bzzzz <lazyvirus@gmx.com>
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

On Wed, May 17, 2017 at 4:14 PM, Bzzzz <lazyvirus@gmx.com> wrote:
> On Wed, 17 May 2017 16:01:16 +0200
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>> Right. I'd indeed be very amused to see a JSON parser land in the
>> Linux kernel.
>
> Perhaps, this could do the trick: https://github.com/martinh/libconfuse

If you'd like to add a JSON parser to the Linux kernel, please direct
your questions to linux-kernel@vger.kernel.org instead. You'll be
asking solely on your own accord; please do _not_ mention WireGuard.
