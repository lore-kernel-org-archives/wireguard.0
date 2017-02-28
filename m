Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04adaf61
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:23:22 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 9e20cbba
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 00:23:22 +0000 (UTC)
Date: Mon, 27 Feb 2017 18:24:24 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
Message-ID: <20170228002424.GA18437@wolff.to>
References: <20170227180434.GA5702@wolff.to>
 <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
 <20170227202205.GA9124@wolff.to> <20170227203727.GA9565@wolff.to>
 <CAHmME9ryT7LWjs+-D4VJpd3DBSQeBa0hUtDUcJ3gBt46xUobiA@mail.gmail.com>
 <20170227221444.GA11938@wolff.to> <20170227223751.GA13376@wolff.to>
 <CAHmME9oWA82Gre1ZDRQCYbOakWsEG-+YCA4jykBybp0tKunrww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9oWA82Gre1ZDRQCYbOakWsEG-+YCA4jykBybp0tKunrww@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Feb 27, 2017 at 15:03:45 -0800,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Fixed

Thanks!

I rebuilt the latest version on both 4.11 and 4.10 Fedora kernels and it 
seems to be working as expected.
