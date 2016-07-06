Return-Path: bruno@wolff.to
Date: Wed, 6 Jul 2016 10:47:15 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160706154715.GA8543@wolff.to>
References: <20160706120410.GA765@wolff.to>
 <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
 <20160706151911.GA11926@wolff.to>
 <CAHmME9qMVsQ1GDMRu862dNJqw006HuGCv4mPdBb7h8urmQOp+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9qMVsQ1GDMRu862dNJqw006HuGCv4mPdBb7h8urmQOp+g@mail.gmail.com>
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 06, 2016 at 17:22:57 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Wed, Jul 6, 2016 at 5:19 PM, Bruno Wolff III <bruno@wolff.to> wrote:
>> Potentially I could get involved with packing wg on Fedora, but there isn't
>> much point until the kernel part is upstream.
>
>Actually Fedora has quite a few modules in packages that aren't
>upstream. They use dkms or akmod.

I thought those usually end up in rpmfusion, copr or other external repos, 
rather than Fedora proper.

I'd still like to see if it is going to land upstream. Even if it ends up 
in 4.9, it'd probably be simpler to just wait and package the wg part 
when the kernel part is included with the Fedora kernel. If upstream declines 
merging it, then things would be different as we'd need to use dkms or akmod 
to make the packages easy to use.
