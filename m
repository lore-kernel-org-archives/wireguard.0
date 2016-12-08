Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54439145
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 02:07:26 +0000 (UTC)
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
 [209.85.161.178])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11133aaa
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 02:07:26 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id a10so310749140ywa.3
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 18:12:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87d1h3jszm.fsf@alice.fifthhorseman.net>
References: <CAHmME9pEq1weLxpOC1c0_nFcO9pmJRtTQ3=H8Hh8AtZyhamqpw@mail.gmail.com>
 <87d1h3jszm.fsf@alice.fifthhorseman.net>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 8 Dec 2016 11:12:34 +0900
Message-ID: <CAKXLc7cASvQ+pPGSN2B820W+kHME9hPD8qYLDtNy+JfvVq5Euw@mail.gmail.com>
Subject: Re: Ephemeral key lifetime & system sleep
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Dec 8, 2016 at 7:04 AM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> I think scrubbing the ephemeral keys prior to suspend is the right thing
> to do.  It's simpler to reason about, sounds straightforward to
> implement, the usability cost isn't that great, and it's likely to be
> the right thing in almost all long-term suspend cases.
>
+1

I never use suspend, except when I need to hack some suspect hardware
(forensics), or ATA SECURITY ERASE a "frozen" drive (anti-forensics).
kill_on_suspend is better, given that it will be auto re-established on resume.

Kalin.
