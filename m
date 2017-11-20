Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dc575ff
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:24:13 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53f9897d
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Nov 2017 16:24:13 +0000 (UTC)
Date: Mon, 20 Nov 2017 16:29:04 +0000
Message-ID: <20171120162904.Horde.O4x4oPnuaPRNPY2TZP7hcF3@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: general protection fault: 0000 [#1] SMP with latest commit
 a073ccac17a85f0c453698d0213cc8b86ecc3dfe
References: <20171120160704.Horde.BsfBQSW63FEc1BxXECCXXS4@www.vdorst.com>
 <CAHmME9oxWCdnmBgHHWAEKSz2DHwT7fFPsZmpESABPqCXJY=e6Q@mail.gmail.com>
 <CAHmME9o_NfoTMSj-aLUYa+N2g1AaYXUXR_JkRrdSTCd1skBuCw@mail.gmail.com>
In-Reply-To: <CAHmME9o_NfoTMSj-aLUYa+N2g1AaYXUXR_JkRrdSTCd1skBuCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Fixed, rebased, force pushed. Let me know if the current master works now.
>
> git fetch && git reset --hard origin/master

Yes that is better :)
Successfully finished the netns.sh test.

Thanks,

René
