Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e29fa98
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 20:35:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f257aab5
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 20:35:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df994b72
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 20:35:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 573ff4aa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 20:35:57 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id r203so98766830oib.3
 for <wireguard@lists.zx2c4.com>; Fri, 07 Apr 2017 13:42:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <03B23E99-75C4-4598-AC0A-3C65F346675F@gmail.com>
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
 <CAHmME9ouagoSmxUy2R0YAhhUhX7PVRpJuP6S6PC+AxHKHtb+BA@mail.gmail.com>
 <03B23E99-75C4-4598-AC0A-3C65F346675F@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Apr 2017 22:42:22 +0200
Message-ID: <CAHmME9oxt=x3tJ5wHitGGjD1yLGweQ4ed3aNv+0Cv9bvPUXDDg@mail.gmail.com>
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
To: George Walker <georgewalkeriv@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?Q?Dave_T=C3=A4ht?= <dave@taht.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey George,

More excellent feedback, thanks. Be sure to CC the list next time though.

If I understand correctly, your suggestion is to not clutter
everything with a horrible "multi:" prefix, but instead allow
multicast addressees, which are well defined, to be added to multiple
peers, and only allow unicast addresses to be added to one peer at a
time keeping the current behavior. I find that a very nice UI
solution. Wonderful.

Jason

On Fri, Apr 7, 2017 at 6:02 PM, George Walker <georgewalkeriv@gmail.com> wrote:
> Cons:
> - A bit too magical.
> - Seems to break paradigm.
>
>
> Another is scalability --the computational and network overhead associated
> with making every peer irrevocably a member of every multicast group.
> Sending all multicast messages to all peers eliminates much of the benefit
> of having more than one multicast address.  That could mean a lot of
> unnecessary handshakes!  I can imagine applications for which this behavior
> would make (accidental or malicious) DoS very easy.
>
> If you only have a lab-scale deployment and generous bandwidth, of course
> receive-side filtering is fine.  But Wireguard's performance and general
> utility would suggest that some will want big far-flung networks that may
> well have need for lots of multicast groups (e.g. industrial IoT), while not
> being able to afford to broadcast everything to everyone.
>
> Thus, there'd have to be
> some explicit way of telling it, "yes I really do want this to be
> duplicated, not moved". Perhaps a "multi:" prefix?
>
>
> I respectfully disagree concerning the necessity to add special, ugly,
> inconsistent UI for the multicast-as-multicast (instead of
> multicast-as-broadcast) approach.  Multicast address ranges are well-known,
> specified in RFCs.  That they behave a little bit differently from unicast
> addresses is expected behavior.  Most of us ignore them and don't use those
> ranges most or all of the time, which works fine.  Thus Multicast support
> (e.g. in routers) doesn't generally interfere with the actual vs. expected
> behavior of the unicast traffic most people use most of the time.
>
> Anyone who is diddling with networking at this level already knows how to
> avoid multicast IPs when they intend unicast (whether they know they do or
> not).
>
> It doesn't seem problematic for a layer 3 VPN to treat adding a unicast
> address when such an address is already an allowedIP as different from
> adding a multicast address (moving in the first case, adding in the second).
> It sounds to me like doing the right (intuitive) thing in each case.
