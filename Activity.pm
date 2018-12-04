=head1 NAME

Activity.pm - An object that has a start and end time. Times are just integers.

=head1 SYNOPSIS

     ##################                          ##################
     ################## EXAMPLES OF SIMPLE USAGE ##################
     ##################                          ##################
     use Activity;
     my $activity = Activity->new(activity => A, startTime => 5, endTime => 12)

=head2 METHODS

=over 12

=item C<new>

I<< new(activity => A, startTime => S, endTime => E) >>

Creates a new activity of type A with a start time of S and end time of E.

B<S> and B<E> are just B<integers>. 

=item C<getActivity>

I<getActivity()>

Returns the activity which was initialized.

=item C<getStartTime>

I<getStartTime()>

Returns the start time of the activity.

=item C<getEndTime>

I<getEndTime()>

Returns the end time of the activity.

=back

=head1 DEPENDENCIES

Carp

=head1 AUTHOR

Matthew Bundy (Author Email)

=cut

package Activity;

#------------------------------ Start the module here ------------------------#

use Carp;
use warnings;
use strict;

sub new {
     #constructor method
     #require parameters
     #activity => A, startTime => S, endTime => E
     my $class = shift;
     my $self = bless {}, $class;
     $self->_init(@_);

     return $self;
}

sub _init {
     my $self = shift;
     my %params = @_;
     #make sure the list of activities is the same length as the start and end times
     foreach my $param (keys %params) {
          $self->{$param} = $params{$param};
     }
     $self->{DEBUG} = 0;
     return;
}

sub getStartTime {
     my $self = shift;
     return $self->{startTime};
}

sub getEndTime {
     my $self = shift;
     return $self->{endTime}
}

sub getActivity {
     my $self = shift;
     return $self->{activity}
}


sub debugOn {
     #changes local variable DEBUG to 1 to enable debug conditionals
     my $self = shift;
     $self->{DEBUG} = 1;
     
}

sub debugOff {
     #changs local variable DEBUG to 0 to dissable debug conditionals
     my $self = shift;
     $self->{DEBUG} = 0;
}

# --- Modules need to return 1 to indicate to the compilier it is successfully loaded
1;
