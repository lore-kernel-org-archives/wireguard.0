Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91f6a623
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 17:50:00 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06f19716
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 17:50:00 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Joe Doss <joe@solidadmin.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Dealing with list volume
In-Reply-To: <7e4be8a2-a4d1-3a65-6c5a-d51aaaccb279@solidadmin.com>
References: <CAHmME9qmjgDJ3bXhWaZ86=iuLi+kDVmLqC0iZnU=3QHA0wBDMg@mail.gmail.com>
 <1463e6b8-2aff-b5f6-4375-dbce686f66c2@solidadmin.com>
 <CAHmME9r4tqFcVXQMaH-sfiNZZEjHjR2PyYbomWOCBObJ6E2+uw@mail.gmail.com>
 <7e4be8a2-a4d1-3a65-6c5a-d51aaaccb279@solidadmin.com>
Date: Fri, 08 Dec 2017 12:56:28 -0500
Message-ID: <87374l14tv.fsf@fifthhorseman.net>
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

On Fri 2017-12-08 10:44:41 -0600, Joe Doss wrote:
> * Large FOSS projects like Fedora have every support channel avail. IRC 
> (https://fedoraproject.org/wiki/IRC), Mailing Lists 
> (https://lists.fedoraproject.org/archives/), GitHub Clone 
> (https://pagure.io/), Forums (https://fedoraforum.org/), Ask Fedora 
> (https://ask.fedoraproject.org/en/questions/) and they don't say well X 
> should be good enough. They let the user pick the channel that works 
> best for them to find help.

You're right that this approach is important for large projects.  What
your request here doesn't acknowledge is that each channel of support
that you make available has some additional cost in terms of time and
energy.

Also, wireguard is *not* currently a "Large FOSS project" -- it's a
small FOSS project with a ton of potential and small but active user and
developer community that is still very much in the experimental phase
(the release notes do not lie!).

If the project adds new support channels, but doesn't have the capacity
(time, energy, knowledge) to maintain them responsibly, that's
potentially a worse situation for the project than just having fewer
support channels.

If Jason feels comfortable managing IRC and a mailing list, but feels
spread too thin to manage a web forum or a discourse instance, i don't
think we should pressure him to spread himself too thin.  He needs some
time left over to focus on the code too, right? ;)

That said, if someone knowledgable from the community wanted to
volunteer to set up, maintain, and supervise an *unofficial* web forum
or other communications platform, with regular reportbacks to to the
support channels that Jason *is* willing to support, i can't imagine
anyone would have a problem with that.  But, be aware that this
represents significant work.  And an ill-maintained, unsupervised
platform that presents itself as a WireGuard support channel (even an
"unofficial" one) is probably *worse* for the project than just
encouraging people to learn to use a mailing list or IRC.

If you're not willing to commit to that maintenance and supervision work
involved with running such a channel, that might be for the same reasons
why Jason might not be willing to commit to it either!

    --dkg
