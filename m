Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d227543f
 for <wireguard@lists.zx2c4.com>; Fri, 5 Jan 2018 16:12:53 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id cd506bcf
 for <wireguard@lists.zx2c4.com>; Fri, 5 Jan 2018 16:12:53 +0000 (UTC)
Date: Fri, 5 Jan 2018 10:11:16 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: Stoyan Mihov <t0ny0@atlantabg.com>
Subject: Re: Question about Wireguard server
Message-ID: <20180105161116.GA18123@wolff.to>
References: <CAL-k0sRpa8Z2sW=z3bCW5pqPyJMCc5i3BMcXHRmZxNoRijTOXQ@mail.gmail.com>
 <CAL-k0sRFgPetkH3n_p4H5cTSA-58bHGJ=mV+rs7tC4kWeqgmiA@mail.gmail.com>
 <CAL-k0sQk=kbFep0xZ-9_xzUqvgGGqa3Y6=nEe=1kWq98Ek9f6w@mail.gmail.com>
 <CAL-k0sST3nZnOPAFYtthv4CFJjpoFDvzpxYDwvP1vt_t4bO+kQ@mail.gmail.com>
 <CAL-k0sTi-g0w4cHw+9K5hqYooupPJVf_bb_tQ3jR-hW=tqmfKA@mail.gmail.com>
 <CAL-k0sShn5t8K4TCgnWgKp74Lf6ASgrA_SDdAEjdL9Vc-J3e4Q@mail.gmail.com>
 <CAL-k0sTux_e2CrQG0Pm2cdk4VxdxW9m+BALQ=Ccw34KH-6D25g@mail.gmail.com>
 <CAL-k0sRUR1DKJK4df1YHvs+3LSJ+qQVUrBgC5-tg2eSjN_wrtw@mail.gmail.com>
 <CAL-k0sTtBWdgV1LfiAF9jjU6T47sT=pYyJgJQej4UmFrA0_27Q@mail.gmail.com>
 <CAL-k0sSF7y63y8wYc0dn2_8j2Sa8_t-U5-5ZZHcRVxh9pRK47w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAL-k0sSF7y63y8wYc0dn2_8j2Sa8_t-U5-5ZZHcRVxh9pRK47w@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jan 04, 2018 at 16:51:19 -0500,
  Stoyan Mihov <t0ny0@atlantabg.com> wrote:
>Greetings dear wireguards!
>
>I am running wireguard on ubuntu 16.04 server and LEDE on router. When I
>have everything set up on the router - I decided to upgrade to a newer
>version of LEDE. So I did, and then my router would not connect to the
>server anymore (although settings have been saved) until I issue a command
>on the server:
>wg-quick down wg0 && wg-quick up wg0
>
>Then the router automatically connects without an issue. Before that - the
>server would not accept a connection from the router, there are no dmesg
>errors, no errors whatsoever on both sides. It simply doesn't show a
>handshake on the server, and the router sends packets, but receives 0
>packets.
>
>Is there an easier way to fix that issue, so a restart on the server would
>not be necessary every time an upgrade on the router is made? Or am I
>missing something obvious (quite possible lol) that resolves that issue?

Is there NAT involved? I saw similar behavior when a port got moved 
because of a source NAT conflict.
