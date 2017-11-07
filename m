Return-Path: greg@kroah.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1740dde
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:31:20 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d0353de
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 09:31:20 +0000 (UTC)
Date: Tue, 7 Nov 2017 10:34:46 +0100
From: Greg KH <greg@kroah.com>
To: =?iso-8859-1?Q?Aur=E9lien?= Chabot <aurelien@chabot.fr>
Subject: Re: [PATCH 1/4] Add wireguard-go as submodule
Message-ID: <20171107093446.GA7891@kroah.com>
References: <20171107043817.9050-1-aurelien@chabot.fr>
 <20171107043817.9050-2-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20171107043817.9050-2-aurelien@chabot.fr>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 07, 2017 at 03:38:12PM +1100, Aurélien Chabot wrote:
> Signed-off-by: Aurélien Chabot <aurelien@chabot.fr>
> ---
>  .gitmodules  | 3 +++
>  wireguard-go | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 100644 .gitmodules
>  create mode 160000 wireguard-go
> 
> diff --git a/.gitmodules b/.gitmodules
> new file mode 100644
> index 0000000..c7957ea
> --- /dev/null
> +++ b/.gitmodules
> @@ -0,0 +1,3 @@
> +[submodule "wireguard-go"]
> +	path = wireguard-go
> +	url = git@github.com:trishika/wireguard-go.git

Ugh, submodules are a pain in git, do you really want to do it this way?
If so, why?  I thought there was a "replacement" for submodules that was
recommended to use instead.

And I mention this because I have a submodule in a project I maintain,
and I _always_ mess it up when I go to update it, and have to go read
the documentation for how to do it properly.

thanks,

greg k-h
