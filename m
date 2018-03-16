Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71587173
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 12:36:09 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b839cdb7
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 12:36:09 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Roman Mamedov <rm.wg@romanrm.net>, wireguard@lists.zx2c4.com
Subject: Re: Include directive to support "conf.d/*" and the like
In-Reply-To: <20180316130222.3a9d0611@natsu>
References: <20180316130222.3a9d0611@natsu>
Date: Fri, 16 Mar 2018 10:59:47 +0000
Message-ID: <87y3isxp3w.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri 2018-03-16 13:02:22 +0500, Roman Mamedov wrote:
> While it would be nice if WireGuard had a "hosts/" directory like Tinc uses
> (basically storing its equivalents of WG's [Peer] sections each in a separate
> file), I feel the most flexible way to support such scenarios would be to have
> a generic "Include" directive. That way I could do
> "Include /etc/wireguard/peers/*.conf" and then not only store each peer
> information in its own file, but also roll-out or fetch and
> add/remove/overwrite those files from a central repository.

If you're automating deployment you can always store the config file
broken out this way and then assemble a single config during deployment
with a simple wrapper script.  or you could generate the full .conf from
some other toolchain entirely (e.g., export from an rdbms or generate
from a dump from some other pki) -- it's not as clean or tightly
integrated as it would be to have an include directive, but it's
certainly easier to rig together.

    --dkg
