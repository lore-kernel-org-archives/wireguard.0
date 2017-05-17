Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c34a0f77
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 16:30:05 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 2a408155
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 16:30:05 +0000 (UTC)
Date: Wed, 17 May 2017 11:37:09 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Wireguard is not building on Fedora with 4.12 rc1 kernels
Message-ID: <20170517163709.GA14317@wolff.to>
References: <20170517144709.GA28773@wolff.to>
 <CAHmME9od2sWr4gRk1Py+rHN1QNihser7eHoj317H8V7qYuA5yw@mail.gmail.com>
 <CAHmME9pZp52EZRd8HSL_nZcf0OiB+EhzmsHDM7AzLn6_h8msVg@mail.gmail.com>
 <20170517152546.GA2693@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20170517152546.GA2693@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, May 17, 2017 at 10:25:46 -0500,
  Bruno Wolff III <bruno@wolff.to> wrote:
>On Wed, May 17, 2017 at 17:16:20 +0200,
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>>Hi again,
>>
>>I think I might have fixed this.
>>
>>git fetch && git reset --hard origin/master
>>
>>And then see if it builds now?
>
>It builds now. In about 15 minutes I'll have it tested.

It took a lot longer than I thought because the remote machine is pretty 
slow and I needed to reinstall the kernel-PAE-devel package.

The two machines do not seem to be connecting. The remote machine 
is using 4.12.0-0.rc0.git2.1.fc27.i686+PAE. So this could potentially 
be a kernel problem. I can reboot the remote machine tonight when I 
get home and see if things work when the kernels match.
