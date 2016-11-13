Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc3d2f48
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:49:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c1173ff
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:49:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2d0b4607
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Nov 2016 00:48:59 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b14so36035369lfg.2
 for <wireguard@lists.zx2c4.com>; Sat, 12 Nov 2016 16:51:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pMzcwjveOoa08-fVCnZTkaoMz8y9DEc7f6b-4PeWu4xQ@mail.gmail.com>
References: <CAHmME9qi7_C7c=wsZg=EwBg3jzFzVmW1eiFGGXgcX8fCcOOZcA@mail.gmail.com>
 <31e050e2-0499-a77e-f698-86e58ad2fa6b@cumulusnetworks.com>
 <CAHmME9o_AM1Lms6CJSpbjfAgcyGuRx8yqwSaNWEbSnY7gGnt6w@mail.gmail.com>
 <CAHmME9oeAuBQJguTFivYsYw4fMoc4+sgxcdS4MArN474m7NjTQ@mail.gmail.com>
 <0dbf5deb-bffb-4878-a268-1adb17c47676@cumulusnetworks.com>
 <CAHmME9owJNvMfF9jHGW7i_jPMaxwPhxQE5W6cxjw14nL0HK0eQ@mail.gmail.com>
 <CAHmME9pMzcwjveOoa08-fVCnZTkaoMz8y9DEc7f6b-4PeWu4xQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 13 Nov 2016 01:51:20 +0100
Message-ID: <CAHmME9qpWCBCHfmjDOL1-7=FJPiqhzh=vg+5dh-hvbbAXnskNQ@mail.gmail.com>
To: David Ahern <dsa@cumulusnetworks.com>
Content-Type: text/plain; charset=UTF-8
Cc: Netdev <netdev@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 LKML <linux-kernel@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 YOSHIFUJI Hideaki <hideaki.yoshifuji@miraclelinux.com>
Subject: Re: [WireGuard] Source address fib invalidation on IPv6
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Nov 13, 2016 at 1:43 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> In perusing through the v6 FIB code, I don't even see an analog of
> __ip_dev_find... Hm?

Of all places, the iscsi code actually has a nice side-by-side
comparison. So far as I can see, the other protocols just omit this
check in the v6 case, which I believe to be errant behavior. For
example, grep for ip_dev_find in the sctp v4 code. The equivalent v6
code is missing the dev check. Ugly! Here's the block I found in
cxgbit_cm.c:

static struct net_device *cxgbit_ipv4_netdev(__be32 saddr)
{
       struct net_device *ndev;

       ndev = __ip_dev_find(&init_net, saddr, false);
       if (!ndev)
               return NULL;

       return cxgbit_get_real_dev(ndev);
}

static struct net_device *cxgbit_ipv6_netdev(struct in6_addr *addr6)
{
       struct net_device *ndev = NULL;
       bool found = false;

       if (IS_ENABLED(CONFIG_IPV6)) {
               for_each_netdev_rcu(&init_net, ndev)
                       if (ipv6_chk_addr(&init_net, addr6, ndev, 1)) {
                               found = true;
                               break;
                       }
       }
       if (!found)
               return NULL;
       return cxgbit_get_real_dev(ndev);
}

It seems like __ip6_dev_find could be made out of that inner loop.
Then existing uses like that iscsi code can be replaced with that
helper function, and the existing ip6 route tail function can be
augmented in the manner you recommended. Seem like a decent
implementation strategy?

I might submit some patches, unless you beat me to it.

Jason
