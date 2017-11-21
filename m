Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed1d3a07
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 20:13:08 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 0cb2cdf6
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 20:13:07 +0000 (UTC)
Date: Tue, 21 Nov 2017 14:15:56 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: d8738d57ab9ab976a1899e73d955d38317f44486 not building with
 4.15.0-0.rc0.git6.
Message-ID: <20171121201556.GA6337@wolff.to>
References: <20171121194137.GA20179@wolff.to>
 <CAHmME9pQvuB8g601HFJgCf0mpvHN+eqoj_2OngmMitKr_eZAgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9pQvuB8g601HFJgCf0mpvHN+eqoj_2OngmMitKr_eZAgw@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 21, 2017 at 20:51:49 +0100,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hi Bruno,
>
>I'll start working on 4.15 after rc1 hits or possibly sooner, as
>there's currently quite a bit of churn at the moment. The current
>errors are caused by:

OK. I switched back to 4.14 and things are fine. Linus was threatening to 
close the merge window early, so maybe we'll get rc1 tomorrow night (-0600).
