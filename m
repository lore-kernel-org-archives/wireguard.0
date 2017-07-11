Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57723737
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:54:52 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 043bfeec
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 22:54:51 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Debian-based configuration for wireguard
In-Reply-To: <CAHmME9qAig60WBrjiz=se=B9zhBfhgMOma17MuiQPGdfs+UgRA@mail.gmail.com>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr> <20170710025323.GC31153@zx2c4.com>
 <1499716437.988.1.camel@eggiecode.org> <87ziccyoo1.fsf@fifthhorseman.net>
 <71133f541e1824a0eeb5e2e624aa1f2f@jmt.gr> <871spmzke6.fsf@fifthhorseman.net>
 <CAHmME9qAig60WBrjiz=se=B9zhBfhgMOma17MuiQPGdfs+UgRA@mail.gmail.com>
Date: Tue, 11 Jul 2017 19:12:09 -0400
Message-ID: <87shi2y3ee.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2017-07-12 00:48:59 +0200, Jason A. Donenfeld wrote:
> It is for this reason that wg(8)'s private-key and preshared-key
> arguments take a file to the key, not the actual key itself.

Right.  but the ifupdown configuration that Egbert has proposed tries to
pull some info from the /etc/network/interfaces stanza and then some
other info from a wireguard configuration file.  To a novice user it
looks pretty confusing because the split seems arbitrary.

So the extension to ifupdown should really take just the path to the key
file as an extra argument, not a path to a full wg(8) conf file.  I
agree with Egbert that this patch isn't ready for integration with
ifupdown, unfortunately.

          --dkg
