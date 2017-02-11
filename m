Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5150742f
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 12:18:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74d8b87f
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 12:18:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c25dac2
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 12:18:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca75f6ff
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 12:18:22 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id 32so45413171oth.3
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 04:32:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Feb 2017 13:32:10 +0100
Message-ID: <CAHmME9otoumBPt4VvdM2s4FEpzO_wK86aiRjVOCpUpGam+P64Q@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: David Anderson <dave@natulte.net>
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

Hey Dave,

On Sat, Feb 11, 2017 at 10:49 AM, David Anderson <dave@natulte.net> wrote:
> Note that right now, only amd64 packages are available. If you think there's
> demand for Debian on 32-bit x86, I can set up i386 builders as well.

I doubt anybody cares about i386, but likely armv{6,7} and arm64 are
in demand somewhat, at the very least due to Rasberrian users.

Jason
