Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eab25dec
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 00:04:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3a484c7
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 00:04:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2503386
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 00:03:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2ab0eb2f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 May 2018 00:03:12 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id y10-v6so19093231otg.10
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 17:06:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180529234831.GA31695@xultrabook>
References: <0e16dad4-2530-7da5-3481-dbebb7441d8b@attglobal.net>
 <20180529234831.GA31695@xultrabook>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 30 May 2018 02:06:27 +0200
Message-ID: <CAHmME9rYt1uLJ8PnFYZrh6BbYw+Ui13m0NSmGa0w1=d8YXYUHQ@mail.gmail.com>
Subject: Re: Where to download old snapshots
To: Tharre <tharre3@gmail.com>, Eddie <stunnel@attglobal.net>
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

On Wed, May 30, 2018 at 1:48 AM, Tharre <tharre3@gmail.com> wrote:
> On 05/29, Eddie wrote:
>> Where can I download a copy of those, as the repository only appears to hold
>> the latest and minus one.
>
> The repo[0] shows snapshots till 0.0.20180202, no?

Nope.

We don't support old snapshots. You shouldn't run old snapshots.
Snapshots are snapshots, not releases. I hope it won't be long before
this becomes a different type of project that doesn't only cut
snapshots but rather real releases. But that isn't the case now. So
for now, use an up-to-date operating system and an up-to-date
snapshot, and you'll be fine. Otherwise you're on your own. Sorry!

Jason
