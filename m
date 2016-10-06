Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 598fb1ad
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 14:54:05 +0000 (UTC)
Date: Thu, 6 Oct 2016 10:03:10 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Jehan Tremback <jehan@altheamesh.com>
Message-ID: <20161006150310.GB30704@wolff.to>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Oct 05, 2016 at 19:12:57 -0700,
  Jehan Tremback <jehan@altheamesh.com> wrote:
>Are there any plans, or would you even consider, adding an option to
>WireGuard to disable encryption, and only authenticate packets? I'm
>assuming that an authentication-only mode would be significantly faster
>(maybe I'm wrong though). My use-case only needs auth, so if I were to
>use WireGuard, the encryption would be redundant.

That would depend on how fast your internet connection is and how much CPU 
power you have. I suspect in many cases the extra latency is negligible 
and it would be rare for encryption to be limiting bandwidth.

Without encryption you authentication won't be useful against attackers 
that can modify packets or insert packets with the source address of your 
contact.
